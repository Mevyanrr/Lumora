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

      await Future.delayed(const Duration(seconds: 1));

      final rekomendasi = RekomendasiAktivitas(
        title: "Rekomendasi aktivitas bertahap",
        recommendations: [
          "Berikan mainan ringan di dekat Si Kecil.",
          "Praktikkan memindah mainan di dekat si kecil.",
          "Ajak Si Kecil untuk melakukan hal yang sama.",
        ],
        info: [
          "Durasi: 5–10 menit",
          "1–2x sehari",
        ],
      );

      final note = Catatan(
    title: "Catatan",
    items: [
      CatatanItem(
        text: "Gunakan benda tidak tajam.",
        type: CatatanType.info,
      ),
      CatatanItem(
        text:
            "Jika belum juga dapat dilakukan, konsultasilah ke tenaga medis.",
        type: CatatanType.warning,
      ),
    ],
  );

      emit(
        NextstepLoaded(
          desc: "Memindahkan barang ke tempat lain",
          img: "assets/images/bayi-nextstep.png",
          rekomendasi: rekomendasi,
          note: note,

        ),
      );
    });
  }
}
