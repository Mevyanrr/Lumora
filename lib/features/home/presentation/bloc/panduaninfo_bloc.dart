import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/features/home/data/models/panduan_item.dart';
import 'package:lumora/features/home/presentation/bloc/panduaninfo_event.dart';
import 'package:lumora/features/home/presentation/bloc/panduaninfo_state.dart';

class PanduanGiziBloc extends Bloc<PanduanGiziEvent, PanduanGiziState> {
  PanduanGiziBloc() : super(PanduanGiziInitial()) {
    on<LoadPanduanGizi>((event, emit) {
      emit(
        PanduanGiziLoaded(
          [
            PanduanItem(
              iconType: PanduanIconType.checklist,
              text: "Sudah dapat mengonsumsi makanan pasca ASI (MPASI)",
            ),
            PanduanItem(
              iconType: PanduanIconType.checklist,
              text: "ASI tetap menjadi sumber penting",
            ),
            PanduanItem(
              iconType: PanduanIconType.checklist,
              text:
                  "Idealnya makan besar (MPASI utama) 2–3x makan setiap 4–5 jam sekali",
            ),
            PanduanItem(
              iconType: PanduanIconType.checklist,
              text: "Dapat diselingi 1–2 kali makan camilan",
            ),
            PanduanItem(
              iconType: PanduanIconType.warning,
              text: "Pastikan makanan sudah dihaluskan",
            ),
          ],
        ),
      );
    });
  }
}
