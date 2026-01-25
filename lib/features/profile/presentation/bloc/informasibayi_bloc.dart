import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/features/profile/domain/models/informasi_bayi_item.dart';
import 'package:lumora/features/profile/presentation/bloc/informasibayi_event.dart';
import 'package:lumora/features/profile/presentation/bloc/informasibayi_state.dart';

class InformasibayiBloc extends Bloc<InformasibayiEvent, InformasibayiState> {
  InformasibayiBloc() : super(InformasibayiInitial()) {
    on<LoadInformasibayi>((event, emit) {
      emit(
        InformasibayiLoaded([
          InformasiBayiItem(icon: 'assets/icons/baby.svg', title: "Aira Airin"),
          InformasiBayiItem(icon: 'assets/icons/calendar.svg', title: "21 Desember 2012"),
          InformasiBayiItem(icon: 'assets/icons/pin.svg', title: "Jalan UB FILKOM"),
          InformasiBayiItem(icon: 'assets/icons/gender.svg', title: "Perempuan"),
          InformasiBayiItem(icon: 'assets/icons/bb.svg', title: "3,7 kg"),
          InformasiBayiItem(icon: 'assets/icons/tb.svg', title: "70 cm"),
          InformasiBayiItem(icon: 'assets/icons/lingkar-kepala.svg', title: "54 cm"),
          InformasiBayiItem(icon: 'assets/icons/injection.svg', title: "Imunisai terakhir 20 November 2025"),
        ]),
      );
    });
  }
}
