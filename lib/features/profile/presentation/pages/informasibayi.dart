import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/kuisioner/services/kuisioner_service.dart';
import 'package:lumora/features/profile/presentation/bloc/informasibayi_bloc.dart';
import 'package:lumora/features/profile/presentation/bloc/informasibayi_event.dart';
import 'package:lumora/features/profile/presentation/bloc/informasibayi_state.dart';
import 'package:lumora/features/profile/presentation/widgets/framesecondary.dart';

class Informasibayi extends StatelessWidget {
  const Informasibayi({super.key});

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
            child: 
            StreamBuilder(
              stream: KuisionerService().getKuisionerData(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }
                final userData = snapshot.data;
                if(userData == null){
                  return const Center(child: Text("Tidak ada data"));
                }

                return
            Column(
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
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: sizeheight * 8 / fullheight,
                            ),
                            child: Framesecondary(
                              size: size,
                              icon: item.icon,
                              title: item.title,
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
                    "Bayi sudah bisa ${userData.kondisi}",
                    style: TextStyle(
                      fontSize: sizewidth * 16 / fullwidth,
                      fontWeight: FontWeight.w400,
                      color: AppColors.txtPrimary,
                    ),
                  ),
                ),
                
              ],
            );
             })
          ),
        ),
      ),
    );
  }
}
