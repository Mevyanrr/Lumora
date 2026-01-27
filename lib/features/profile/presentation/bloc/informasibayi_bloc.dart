import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lumora/features/kuisioner/services/kuisioner_service.dart';
import 'package:lumora/features/profile/domain/models/informasi_bayi_item.dart';
import 'package:lumora/features/profile/presentation/bloc/informasibayi_event.dart';
import 'package:lumora/features/profile/presentation/bloc/informasibayi_state.dart';
import 'package:lumora/model/baby_model.dart';

class InformasibayiBloc extends Bloc<InformasibayiEvent, InformasibayiState> {
  final getDataBayi = KuisionerService();
  InformasibayiBloc() : super(InformasibayiInitial()) {
    on<LoadInformasibayi>((event, emit) async {

      await emit.forEach<BabyModel?>(
        getDataBayi.getKuisionerData(),
        onData: (babyData){
          List<InformasiBayiItem> uiList = [
            InformasiBayiItem(
              icon: 'assets/icons/baby.svg', 
              title: babyData?.nama ?? '-', // Ambil dari model
            ),
            InformasiBayiItem(
              icon: 'assets/icons/calendar.svg', 
              title: '${DateFormat('EEEE').format(babyData!.tanggalLahir)}, ${babyData.tanggalLahir.day} ${DateFormat.MMMM().format(babyData!.tanggalLahir)} ${babyData?.tanggalLahir.year}' ?? DateTime.now().toString(), // Sesuaikan format tanggal jika perlu
            ),
            InformasiBayiItem(
              icon: 'assets/icons/pin.svg', 
              title: babyData?.jenisKelamin ?? '-', //ini harusnya alamat
            ),
            InformasiBayiItem(
              icon: 'assets/icons/gender.svg', 
              title: babyData?.jenisKelamin ?? '-',
            ),
            InformasiBayiItem(
              icon: 'assets/icons/bb.svg', 
              title: "${babyData?.beratBadan ?? 0} kg",
            ),
            InformasiBayiItem(
              icon: 'assets/icons/tb.svg', 
              title: "${babyData?.tinggiBadan ?? 0} cm",
            ),
            InformasiBayiItem(icon: 'assets/icons/injection.svg', title: "Imunisai terakhir 20 November 2025"),
          ];
          return InformasibayiLoaded(uiList);
        });
      // emit(
      //   InformasibayiLoaded([
      //     InformasiBayiItem(icon: 'assets/icons/baby.svg', title: "Aira Airin"),
      //     InformasiBayiItem(icon: 'assets/icons/calendar.svg', title: "21 Desember 2012"),
      //     InformasiBayiItem(icon: 'assets/icons/pin.svg', title: "Jalan UB FILKOM"),
      //     InformasiBayiItem(icon: 'assets/icons/gender.svg', title: "Perempuan"),
      //     InformasiBayiItem(icon: 'assets/icons/bb.svg', title: "3,7 kg"),
      //     InformasiBayiItem(icon: 'assets/icons/tb.svg', title: "70 cm"),
      //     InformasiBayiItem(icon: 'assets/icons/lingkar-kepala.svg', title: "54 cm"),
      //     InformasiBayiItem(icon: 'assets/icons/injection.svg', title: "Imunisai terakhir 20 November 2025"),
      //   ]),
      // ); 
    });
  }
}
