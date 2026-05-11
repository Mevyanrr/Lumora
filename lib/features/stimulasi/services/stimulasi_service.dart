import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lumora/features/stimulasi/data/models/aktivitas.dart';
import 'package:lumora/features/stimulasi/data/models/aktivitas_template.dart';
import 'package:lumora/features/stimulasi/data/models/stimulate_date.dart';
import 'package:lumora/features/stimulasi/data/templates/aktivitas_template_seed.dart';

class StimulasiService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  

  Future<void> updateActivityProgress(Aktivitas aktivitas) async {
    final String uid = auth.currentUser?.uid ?? '';
    try{
      final docref = firestore.collection('bayi').doc(uid).collection('stimulasi').doc(uid).collection('aktivitas').doc(aktivitas.id);
      await docref.set(aktivitas.toMap(), SetOptions(merge: true));
    }catch(e){
      print("gagal menyimpan aktivitas $e");
    }
  }

  /// Seed semua template aktivitas ke Firestore.
  /// Cukup dipanggil SATU KALI dari admin/developer.
  /// Simpan di: aktivitas_template/{ageRange}/aktivitas/{id}
  Future<void> seedTemplateAktivitas() async {
    final templates = AktivitasTemplateSeed.allTemplates;
    final batch = firestore.batch();

    for (final entry in templates.entries) {
      final ageRange = entry.key; // e.g. '0-2'
      for (final item in entry.value) {
        final ref = firestore
            .collection('aktivitas_template')
            .doc(ageRange)
            .collection('aktivitas')
            .doc(item['id'] as String);
        batch.set(ref, item);
      }
    }

    await batch.commit();
    print('Seed template aktivitas berhasil!');
  }

  /// Ambil range usia dari tanggal lahir bayi.
  /// Return format: '0-2', '3-5', dst. Null jika di luar range.
  String? _getAgeRange(DateTime birthDate) {
    final now = DateTime.now();
    final months = (now.year - birthDate.year) * 12 + (now.month - birthDate.month);

    if (months <= 2) return '0-2';
    if (months <= 5) return '3-5';
    if (months <= 8) return '6-8';
    if (months <= 11) return '9-11';
    if (months <= 14) return '12-14';
    if (months <= 17) return '15-17';
    if (months <= 20) return '18-20';
    if (months <= 24) return '21-24';
    return null; // Di atas 24 bulan
  }

  /// Inisialisasi aktivitas user berdasarkan usia bayi.
  /// Mengambil template dari Firestore dan menyalin ke data user.
  /// Dipanggil setiap LoadAktivitas agar otomatis menyesuaikan usia.
  Future<void> initAktivitasFromTemplate(DateTime birthDate) async {
    final String uid = auth.currentUser?.uid ?? '';
    if (uid.isEmpty) return;

    final ageRange = _getAgeRange(birthDate);
    if (ageRange == null) return; // Bayi > 24 bulan, skip

    try {
      final userAktivitasRef = firestore
          .collection('bayi')
          .doc(uid)
          .collection('stimulasi')
          .doc(uid)
          .collection('aktivitas');

      // Cek apakah sudah ada data user & apakah ageRange-nya sama
      final metaRef = firestore.collection('bayi').doc(uid).collection('stimulasi').doc(uid);
      final metaSnap = await metaRef.get();
      final savedAgeRange = metaSnap.data()?['currentAgeRange'] as String?;

      if (savedAgeRange == ageRange) return; // Usia belum berubah, skip

      // Ambil template dari Firestore
      final templateSnap = await firestore
          .collection('aktivitas_template')
          .doc(ageRange)
          .collection('aktivitas')
          .get();

      if (templateSnap.docs.isEmpty) {
        // Fallback: seed dulu dari hardcode jika belum ada di Firestore
        await seedTemplateAktivitas();
        return;
      }

      // Hitung bulan sebelumnya untuk range 'bulanLalu'
      final prevRange = _getPrevAgeRange(ageRange);
      List<AktivitasTemplate> prevTemplates = [];
      if (prevRange != null) {
        final prevSnap = await firestore
            .collection('aktivitas_template')
            .doc(prevRange)
            .collection('aktivitas')
            .get();
        prevTemplates = prevSnap.docs.map((d) => AktivitasTemplate.fromFirestore(d)).toList();
      }

      // Ambil progress user saat ini agar tidak hilang
      final existingSnap = await userAktivitasRef.get();
      final existingProgress = <String, Map<String, dynamic>>{};
      for (final doc in existingSnap.docs) {
        existingProgress[doc.id] = doc.data();
      }

      final batch = firestore.batch();

      // Tulis aktivitas bulan ini ke Firestore user
      for (final doc in templateSnap.docs) {
        final template = AktivitasTemplate.fromFirestore(doc);
        final existing = existingProgress[template.id];
        final ref = userAktivitasRef.doc(template.id);
        batch.set(ref, {
          'id': template.id,
          'title': template.title,
          'description': template.description,
          'fungsi': template.fungsi,
          'actvtotal': template.actvtotal,
          'totalCount': template.totalCount,
          'doneCount': existing?['doneCount'] ?? 0,
          'isCompleted': existing?['isCompleted'] ?? false,
          'periode': PeriodeAktivitas.bulanIni.toString(),
        });
      }

      // Tulis aktivitas bulan lalu (yang belum selesai) ke Firestore user
      for (final template in prevTemplates) {
        final existing = existingProgress[template.id];
        final isCompleted = existing?['isCompleted'] as bool? ?? false;
        if (!isCompleted) {
          final ref = userAktivitasRef.doc('prev_${template.id}');
          batch.set(ref, {
            'id': 'prev_${template.id}',
            'title': template.title,
            'description': template.description,
            'fungsi': template.fungsi,
            'actvtotal': template.actvtotal,
            'totalCount': template.totalCount,
            'doneCount': existing?['doneCount'] ?? 0,
            'isCompleted': false,
            'periode': PeriodeAktivitas.bulanLalu.toString(),
          });
        }
      }

      // Simpan ageRange ke meta agar tidak re-init setiap buka app
      batch.set(metaRef, {'currentAgeRange': ageRange}, SetOptions(merge: true));

      await batch.commit();
      print('Aktivitas berhasil diinit dari template usia $ageRange');
    } catch (e) {
      print('Gagal init aktivitas dari template: $e');
    }
  }

  String? _getPrevAgeRange(String currentRange) {
    const ranges = ['0-2', '3-5', '6-8', '9-11', '12-14', '15-17', '18-20', '21-24'];
    final idx = ranges.indexOf(currentRange);
    if (idx <= 0) return null;
    return ranges[idx - 1];
  }

  Stream<List<Aktivitas>> getActivityFromFirestore(){
    final uid = auth.currentUser?.uid ?? '';
    if(uid == null){
      return Stream.value([]);
    }

    return firestore.collection('bayi').doc(uid).collection('stimulasi').doc(uid).collection('aktivitas').snapshots().map((querySnapshot){
      return querySnapshot.docs.map((doc){
        return Aktivitas.fromFirestore(doc);
      }).toList();
    });
  }

  Future<void> saveDate(StimulateDate stimulate_date) async {
    final String uid = auth.currentUser?.uid ?? '';
    try{
      final docref = firestore.collection('bayi').doc(uid).collection('stimulasi').doc(uid);
      await docref.set(stimulate_date.toMap(), SetOptions(merge: true));
    }catch(e){
      print("gagal menyimpan data $e");
    }
  }

  Stream<StimulateDate?> getDateFromFirestore() {
    final uid = auth.currentUser?.uid;
    if(uid == null) return Stream.value(null);

    return firestore
    .collection('bayi')
    .doc(uid)
    .collection('stimulasi')
    .doc(uid)
    .snapshots()
    .map((snapshot){
      if(snapshot.exists && snapshot.data() != null){
        return StimulateDate.fromFirestore(snapshot);
      }
      return null;
    });
  }

    Future<void> saveProgress(Aktivitas activity) async {
    final String uid = auth.currentUser?.uid ?? '';
    try{
      final docref = firestore.collection('bayi').doc(uid).collection('stimulasi').doc(uid);
      await docref.set(activity.toMap(), SetOptions(merge: true));
    }catch(e){
      print("gagal menyimpan data $e");
    }
  }

  //   Stream<Aktivitas?> getActivityFromFirestore() {
  //   final uid = auth.currentUser?.uid;
  //   if(uid == null) return Stream.value(null);

  //   return firestore
  //   .collection('bayi')
  //   .doc(uid)
  //   .collection('stimulasi')
  //   .doc(uid)
  //   .snapshots()
  //   .map((snapshot){
  //     if(snapshot.exists && snapshot.data() != null){
  //       return Aktivitas.fromFirestore(snapshot);
  //     }
  //     return null;
  //   });
  // }

  Stream<int> getStreakStream() {
    final uid = auth.currentUser?.uid;
    if (uid == null) return Stream.value(0);

    return firestore
        .collection('bayi')
        .doc(uid)
        .collection('stimulasi')
        .doc('streak')
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        final data = snapshot.data()!;
        final lastActivityDateTimestamp = data['lastActivityDate'] as Timestamp?;
        final currentStreak = data['streakCount'] as int? ?? 0;
        
        if (lastActivityDateTimestamp != null) {
          final now = DateTime.now();
          final today = DateTime(now.year, now.month, now.day);
          final lastActivityDateRaw = lastActivityDateTimestamp.toDate();
          final lastActivityDate = DateTime(lastActivityDateRaw.year, lastActivityDateRaw.month, lastActivityDateRaw.day);
          
          if (today.difference(lastActivityDate).inDays > 1) {
            return 0; // Streak broken
          }
          return currentStreak;
        }
      }
      return 0;
    });
  }

  Future<void> updateStreak() async {
    final String uid = auth.currentUser?.uid ?? '';
    if (uid.isEmpty) return;
    try {
      final docref = firestore.collection('bayi').doc(uid).collection('stimulasi').doc('streak');
      final snapshot = await docref.get();
      
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      
      if (snapshot.exists && snapshot.data() != null) {
        final data = snapshot.data()!;
        final lastActivityDateTimestamp = data['lastActivityDate'] as Timestamp?;
        final currentStreak = data['streakCount'] as int? ?? 0;
        
        if (lastActivityDateTimestamp != null) {
          final lastActivityDateRaw = lastActivityDateTimestamp.toDate();
          final lastActivityDate = DateTime(lastActivityDateRaw.year, lastActivityDateRaw.month, lastActivityDateRaw.day);
          
          final difference = today.difference(lastActivityDate).inDays;
          
          if (difference == 0) {
            return;
          } else if (difference == 1) {
            await docref.set({
              'lastActivityDate': FieldValue.serverTimestamp(),
              'streakCount': currentStreak + 1,
            }, SetOptions(merge: true));
          } else {
            await docref.set({
              'lastActivityDate': FieldValue.serverTimestamp(),
              'streakCount': 1,
            }, SetOptions(merge: true));
          }
        } else {
          await docref.set({
            'lastActivityDate': FieldValue.serverTimestamp(),
            'streakCount': 1,
          }, SetOptions(merge: true));
        }
      } else {
        await docref.set({
          'lastActivityDate': FieldValue.serverTimestamp(),
          'streakCount': 1,
        });
      }
    } catch (e) {
      print("gagal update streak $e");
    }
  }

}