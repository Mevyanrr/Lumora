import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/kuisioner/services/kuisioner_service.dart';
import 'package:lumora/features/profile/presentation/bloc/informasibayi_bloc.dart';
import 'package:lumora/features/profile/presentation/bloc/informasibayi_event.dart';
import 'package:lumora/features/profile/presentation/bloc/informasibayi_state.dart';
import 'package:lumora/features/profile/presentation/widgets/framesecondary.dart';
import 'package:lumora/helper/pick_location.dart';

class Informasibayi extends StatelessWidget {
  const Informasibayi({super.key});

  Future<void> _pickTanggalLahir(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 180)),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      helpText: 'Pilih Tanggal Lahir Bayi',
      cancelText: 'Batal',
      confirmText: 'Simpan',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryOrange,
              onPrimary: AppColors.txtPrimary,
              surface: AppColors.background,
              onSurface: AppColors.txtPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      // Simpan tanggal lahir baru ke Firestore via KuisionerService
      await KuisionerService().updateTanggalLahir(picked);
      // Refresh informasi bayi bloc
      // ignore: use_build_context_synchronously
      context.read<InformasibayiBloc>().add(LoadInformasibayi());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return BlocProvider(
      create: (_) => InformasibayiBloc()..add(LoadInformasibayi()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.txtPrimary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Informasi Bayi",
            style: TextStyle(
              fontSize: sizewidth * 22 / fullwidth,
              fontWeight: FontWeight.w600,
              color: AppColors.txtPrimary,
            ),
          ),
          backgroundColor: AppColors.background,
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: sizewidth * 17 / fullwidth,
              right: sizewidth * 17 / fullwidth,
              top: sizeheight * 27 / fullheight,
              bottom: sizeheight * 47 / fullheight,
            ),
            child: StreamBuilder(
              stream: KuisionerService().getKuisionerData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                final userData = snapshot.data;
                if (userData == null) {
                  return const Center(child: Text("Tidak ada data"));
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Informasi Umum",
                      style: TextStyle(
                        fontSize: sizewidth * 18 / fullwidth,
                        fontWeight: FontWeight.w500,
                        color: AppColors.txtPrimary,
                      ),
                    ),

                    SizedBox(height: sizeheight * 8 / fullheight),
                    BlocBuilder<InformasibayiBloc, InformasibayiState>(
                      builder: (context, state) {
                        if (state is InformasibayiLoaded) {
                          return Column(
                            children: List.generate(state.items.length, (index) {
                              final item = state.items[index];

                              VoidCallback? onTap;

                              if (index == 1) {
                                // Index 1 = tanggal lahir, bisa diklik untuk ubah
                                onTap = () => _pickTanggalLahir(context);
                              } else if (index == 2) {
                                // Index 2 = lokasi/alamat
                                onTap = () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PickLocationPage(),
                                    ),
                                  );
                                  if (result != null) {
                                    await KuisionerService()
                                        .saveAddress(result["address"]);
                                  }
                                };
                              }

                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: sizeheight * 8 / fullheight,
                                ),
                                child: Stack(
                                  children: [
                                    Framesecondary(
                                      size: size,
                                      icon: item.icon,
                                      title: item.title,
                                      onTap: onTap,
                                    ),
                                    // Tampilkan ikon edit kecil di tanggal lahir
                                    if (index == 1)
                                      Positioned(
                                        right: sizewidth * 12 / fullwidth,
                                        top: 0,
                                        bottom: 0,
                                        child: Center(
                                          child: Icon(
                                            Icons.edit_calendar_outlined,
                                            size: sizewidth * 18 / fullwidth,
                                            color: AppColors.txtPrimary,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            }),
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),

                    SizedBox(height: sizeheight * 32 / fullheight),

                    Text(
                      "Informasi Tambahan",
                      style: TextStyle(
                        fontSize: sizewidth * 18 / fullwidth,
                        fontWeight: FontWeight.w500,
                        color: AppColors.txtPrimary,
                      ),
                    ),

                    SizedBox(height: sizeheight * 8 / fullheight),

                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: sizeheight * 16 / fullheight,
                        horizontal: sizewidth * 16 / fullwidth,
                      ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          sizewidth * 12 / fullwidth,
                        ),
                        color: AppColors.primaryOrange,
                      ),

                      child: Text(
                        "Bayi sudah bisa ${userData.kondisi.join(', ')}",
                        style: TextStyle(
                          fontSize: sizewidth * 16 / fullwidth,
                          fontWeight: FontWeight.w400,
                          color: AppColors.txtPrimary,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
