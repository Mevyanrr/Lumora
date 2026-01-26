import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GeminiAnalysisService {
  //btw ini api key sengaja disalahin diawal ditambah 'b' biar ga boros
  final String apiKey = dotenv.env['API_KEY']!.substring(1);
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user;

  Map<String, dynamic> _parseGeminiJson(String textResponse){
    try{
      String rawJson = textResponse;
      if(rawJson.contains("```json")){
        rawJson = rawJson.split("```json")[1].split("```")[0].trim();
      } if (rawJson.contains("```")){
        rawJson = rawJson.split("```")[1].split("```")[0].trim();
      }
      rawJson = rawJson.replaceAll(RegExp(r'[^\x00-\x7F]+'), '').trim();
      return jsonDecode(rawJson);
    }
    catch(e){
      print("LOG: Gagal parse JSON Gemini - $e");
      return {};
    }
  }

  Future<Map<String, dynamic>> analyzeGrowthData() async{
    try{
      user = auth.currentUser;
      if(user == null){
        print("LOG: User tidak ditemukan untuk analisis Gemini");
        return {};
      }
      print("LOG: Memulai analisis Gemini untuk user ${user!.uid}");
      DocumentSnapshot userDoc = await firestore.collection('bayi').doc(user!.uid).get();

      if(!userDoc.exists){
        print("LOG: Data bayi tidak ditemukan untuk user ${user!.uid}");
        return {};
      }
      Map<String, dynamic> rawData = userDoc.data() as Map<String, dynamic>;

      print("LOG: Data User ID: ${user!.uid}");
      print("LOG: Isi Raw Data: $rawData");

      Map<String, dynamic> babyData = rawData.map((key, value) {
        if(value is Timestamp){
          return MapEntry(key, value.toDate().toIso8601String());
        }
        return MapEntry(key, value);
      });
      print("LOG: Data bayi berhasil diambil untuk analisis Gemini");
      
      DateTime tanggalLahir;
      if(rawData['tanggalLahir'] is Timestamp){
        tanggalLahir = (rawData['tanggalLahir'] as Timestamp).toDate();
      } else if(babyData['tanggalLahir'] is String){
        tanggalLahir = DateTime.parse(babyData['tanggalLahir']);
      } else {
        tanggalLahir = DateTime.now();
      }

      int hitungBulan = DateTime.now().month - tanggalLahir.month + (12 * (DateTime.now().year - tanggalLahir.year));
      int hitungHari = DateTime.now().day - tanggalLahir.day; 

      String fase = hitungBulan < 6 ? "Fase ASI Eksklusif (Belum Makan)" : "Fase Makan/MPASI";
      
      if(hitungHari < 0){
        hitungBulan -= 1;
        hitungHari += DateTime(tanggalLahir.year, tanggalLahir.month + hitungBulan + 1, 0).day;
      }
      String usiaKalkulasi = "$hitungBulan Bulan, $hitungHari Hari";

String prompt = """
      Role: Dokter Spesialis Anak & Konsultan Laktasi dari data: ${jsonEncode(babyData)}. 
      - Tanggal Lahir: ${tanggalLahir.toIso8601String()}
      - Usia Terhitung: $usiaKalkulasi  <-- INI CARA MASUKINNYA
      
      Data Anak:
      - Nama: ${babyData['nama']}
      - Usia: $usiaKalkulasi
      - Fase: $fase
      TUGAS: Buat panduan perawatan & gizi harian format JSON.
      
      LOGIKA KONTEN (PENTING):
      1. JIKA USIA < 6 BULAN: 
         - Fokus total ke ASI/Sufor. JANGAN sarankan makanan padat/bubur.
         - "menu_harian" diisi dengan rekomendasi aktivitas (contoh: "Tummy Time", "Pijat Ilu") atau info menyusui.
         - "panduan_porsi" diisi dengan frekuensi menyusui atau "Lewat ASI".
      2. JIKA USIA > 6 BULAN:
         - Fokus ke MPASI, Tekstur, dan Gizi Seimbang.
         - "panduan_porsi" WAJIB diisi takaran spesifik (misal: "2-3 porsi", "1/2 porsi", "1 porsi").
      ATURAN FORMAT UI (STRICT):
      - "usia_detail": WAJIB SAMA PERSIS: "$usiaKalkulasi".
      - "checklist_rekomendasi": Kalimat pendek (3-6 kata).
      - "panduan_porsi": Maksimal 3 kata. Jika bayi < 6 bulan, isi porsi dengan "Via ASI" atau "Sesuai Kebutuhan. Jika bayi > 6 bulan isi porsi sesuai kondisi anak dalam bentuk jumlah, misalnya (3-4 porsi)".
      - "menu_harian": Deskripsi maksimal 2 kalimat pendek.
      
      OUTPUT JSON (Bahasa Indonesia):
      {
        "checklist_rekomendasi": [
          { "text": "Contoh: Lanjut ASI Eksklusif / Mulai MPASI", "is_warning": false },
          { "text": "Contoh: Jemur pagi 15 menit", "is_warning": false },
          { "text": "Contoh: Perhatikan pelekatan menyusui", "is_warning": true }
        ],
       "panduan_porsi": [
          { "kategori": "Buah", "porsi": "ISI_SESUAI_USIA" }, 
          { "kategori": "Sayuran", "porsi": "ISI_SESUAI_USIA" },
          { "kategori": "Protein", "porsi": "ISI_SESUAI_USIA" },
          { "kategori": "Karbo", "porsi": "ISI_SESUAI_USIA" }
        ],
        "menu_harian": [
          { 
            "nama_menu": "Nama Menu / Aktivitas", 
            "deskripsi": "Penjelasan singkat manfaatnya." 
          },
          { 
            "nama_menu": "Nama Menu / Aktivitas", 
            "deskripsi": "Penjelasan singkat manfaatnya." 
          }
        ],
        "tips_gizi": [
          "Tip singkat 1",
          "Tip singkat 2",
          "Tip singkat 3",
          "Tip singkat 4"
        ]
      }
      """;      final response = await http.post(
        Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [
            {'parts': [{'text': prompt}]}
          ]
        })
      ).timeout(const Duration(seconds: 30)); 

      print("LOG: Permintaan selesai. Status code: ${response.statusCode}");
      if(response.statusCode == 200){
        final responseData = jsonDecode(response.body);
        final textResponse = responseData['candidates'][0]['content']['parts'][0]['text'];
        final Map<String, dynamic> parsedResult = _parseGeminiJson(textResponse);
        parsedResult['nama_fix'] = babyData['nama'] ?? "Si Kecil";
        parsedResult['usia_fix'] = usiaKalkulasi;
        print("LOG: Respon teks dari Gemini diterima.");
        return parsedResult;
      } else {
        print("LOG: Gagal mendapatkan respon valid dari Gemini. Body: ${response.body}");
        return {};
      }


    } catch(e){
      print("Error: $e");
      return {};
    }
  }

  Future<Map<String, dynamic>> analyzeNutrient() async {
    try{
      user = auth.currentUser;
      if(user == null){
        print("LOG: User tidak ditemukan untuk analisis nutrisi Gemini");
        return {};
      }
      print("LOG: Memulai analisis nutrisi Gemini untuk user ${user!.uid}");
      QuerySnapshot userDoc = await firestore.collection('bayi').doc(auth.currentUser?.uid ?? '').collection('analisis_makanan').orderBy('timestamp', descending: true).limit(1).get();
      if(userDoc.docs.isEmpty){
        print("LOG: Data makanan tidak ditemukan untuk user ${user!.uid}");
        return {};
      } else if(userDoc.docs.isNotEmpty){
      final doc = userDoc.docs.first;
      final List<dynamic> makananDynamic = doc['makanan'] ?? [];
      final List<String> makanan = makananDynamic.map((item) => item.toString()).toList();
      print("LOG: Data makanan berhasil diambil untuk analisis nutrisi Gemini: $makanan");
      String prompt = """
    Role: Ahli Gizi Anak Profesional & Dokter Spesialis Anak.
    
    DATA MAKANAN DARI USER:
    [${makanan.join(", ")}]

    TUGAS UTAMA:
    Analisis daftar makanan di atas, lalu kelompokkan item-item tersebut ke dalam 4 Pilar Gizi.
    
    ATURAN "MAPPING" (SANGAT PENTING):
    1. Kamu harus mencari item dari [DATA MAKANAN DARI USER] yang cocok untuk setiap kategori.
    2. JANGAN MENGARANG menu yang tidak ditulis user.
    3. Jika user menulis "Nasi Ayam", maka:
       - Karbohidrat: "Nasi" (diambil dari konteks) atau "Nasi Ayam".
       - Protein: "Ayam" (diambil dari konteks) atau "Nasi Ayam".
    4. Jika kategori kosong (misal tidak ada sayur), tulis "Tidak ada" di field menu_penunjang.

    KRITERIA 4 PILAR:
    1. Karbohidrat: Nasi, bubur, kentang, roti, mie, jagung, ubi, sereal, biskuit.
    2. Protein: Ayam, daging sapi, hati, telur, ikan, tahu, tempe, keju, yogurt.
    3. Vitamin (Sayur/Buah): Bayam, wortel, brokoli, pisang, apel, jeruk, pepaya, labu.
    4. Cairan: Air putih, susu (ASI/Sufor/UHT), kuah sup, jus, air kelapa.

    SCORING & STATUS:
    - Beri nilai persen (0-100) berdasarkan kualitas & keberadaan item di kategori tersebut.
    - Status "good": Jika rata-rata persen > 60.
    - Status "bad": Jika rata-rata persen < 60 atau ada kategori bernilai 0 (Missing).

    FORMAT OUTPUT JSON (Strict JSON, No Markdown):
    {
      "status_keseluruhan": "good" atau "bad",
      "analisis_gizi": {
        "karbohidrat": { 
            "persen": 90, 
            "menu_penunjang": "AMBIL DARI INPUT USER / Tidak ada" 
        },
        "protein": { 
            "persen": 85, 
            "menu_penunjang": "AMBIL DARI INPUT USER / Tidak ada" 
        },
        "vitamin": { 
            "persen": 10, 
            "menu_penunjang": "AMBIL DARI INPUT USER / Tidak ada" 
        },
        "cairan": { 
            "persen": 100, 
            "menu_penunjang": "AMBIL DARI INPUT USER / Tidak ada" 
        }
      },
      "saran_singkat": ["+ Buah", "+ Air"],
      "rekomendasi_menu": [
        {
          "nama_menu": "Nama Menu 1",
          "deskripsi": "Deskripsi manfaat gizi"
        },
        {
          "nama_menu": "Nama Menu 2",
          "deskripsi": "Deskripsi manfaat gizi"
        }
      ]
    }
    """;
    final response = await http.post(
    Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'contents': [
        {'parts': [{'text': prompt}]}
      ]
    })
    ).timeout(const Duration(seconds: 30));
    
          print("LOG: Permintaan selesai. Status code: ${response.statusCode}");
          if(response.statusCode == 200){
            final responseData = jsonDecode(response.body);
            final textResponse = responseData['candidates'][0]['content']['parts'][0]['text'];
            final Map<String, dynamic> parsedResult = _parseGeminiJson(textResponse);
            return parsedResult;
          } else {
            print("LOG: Gagal mendapatkan respon valid dari Gemini. Body: ${response.body}");
            return {};
          }
      } else {
        return {};
      }
    } catch(e){
      print("Error: $e");
      return {};
    }
  }
}