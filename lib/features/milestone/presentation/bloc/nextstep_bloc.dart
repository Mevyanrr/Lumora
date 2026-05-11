import 'package:bloc/bloc.dart';
import 'package:lumora/features/milestone/data/models/catatan.dart';
import 'package:lumora/features/milestone/data/models/catatan_item.dart';
import 'package:lumora/features/milestone/data/models/rekomendasi_aktvitas.dart';
import 'package:lumora/features/milestone/presentation/bloc/nextstep_event.dart';
import 'package:lumora/features/milestone/presentation/bloc/nextstep_state.dart';

class NextstepBloc extends Bloc<NextstepEvent, NextstepState> {
  NextstepBloc() : super(NextstepInitial()) {
    on<FetchNextstep>((event, emit) async {
      emit(NextstepLoading());

      await Future.delayed(const Duration(milliseconds: 300));

      final rekomendasi = RekomendasiAktivitas(
        title: 'Cara membantu Si Kecil',
        recommendations: _buildRecommendations(event.activityDescription),
        info: [event.activityAcvtotal],
      );

      final note = Catatan(
        title: 'Catatan',
        items: [
          CatatanItem(
            text: event.activityFungsi,
            type: CatatanType.info,
          ),
          CatatanItem(
            text: 'Jika belum juga dapat dilakukan, konsultasilah ke tenaga medis.',
            type: CatatanType.warning,
          ),
        ],
      );

      emit(NextstepLoaded(
        desc: event.activityTitle,
        img: 'assets/images/bayi-nextstep.png',
        rekomendasi: rekomendasi,
        note: note,
      ));
    });
  }

  /// Bagi deskripsi aktivitas menjadi beberapa langkah rekomendasi
  List<String> _buildRecommendations(String description) {
    // Pisahkan kalimat jadi max 3 poin tips
    final sentences = description.split('. ').where((s) => s.trim().isNotEmpty).toList();
    if (sentences.length <= 1) {
      return [description.trim()];
    }
    // Kelompokkan kalimat jika banyak
    if (sentences.length == 2) {
      return sentences.map((s) => s.endsWith('.') ? s : '$s.').toList();
    }
    // 3+ kalimat: ambil max 3
    return sentences
        .take(3)
        .map((s) => s.endsWith('.') ? s : '$s.')
        .toList();
  }
}
