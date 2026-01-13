import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_bloc.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_event.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_state.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page1.dart';
import 'package:lumora/features/kuisioner/presentation/widgets/top_container.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: sizeheight * 77 / fullheight),
          child: Column(
            children: [
              TopContainer(
                stepPage: "4 / 4",
                image: "assets/images/kuisioner-4.png",
              ),

              SizedBox(height: sizeheight * 30 / fullheight),

             
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: sizewidth*40/fullwidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saat ini bayi sudah bisa?",
                            style: TextStyle(
                              color: AppColors.txtPrimary,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          
                                        BlocBuilder<KuisionerBloc, KuisionerState>(
                                          builder: (context, state) {
                                            return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'A',
                                  groupValue: state.gender,
                                  onChanged: (value) {
                                    context.read<KuisionerBloc>().add(
                                      PilAktivitasBayi(value!),
                                    );
                                  },
                                ),
                                
                                SizedBox(width: sizewidth * 12 / fullwidth),
                                Text(
                                  'Tengkurap',
                                  style: TextStyle(
                                    color: AppColors.txtPrimary,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'B',
                                  groupValue: state.gender,
                                  onChanged: (value) {
                                    context.read<KuisionerBloc>().add(
                                      PilAktivitasBayi(value!),
                                    );
                                  },
                                ),
                                SizedBox(width: sizewidth * 12 / fullwidth),
                                Text(
                                  'Duduk dengan bantuan',
                                  style: TextStyle(
                                    color: AppColors.txtPrimary,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'C',
                                  groupValue: state.gender,
                                  onChanged: (value) {
                                    context.read<KuisionerBloc>().add(
                                      PilAktivitasBayi(value!),
                                    );
                                  },
                                ),
                                SizedBox(width: sizewidth * 12 / fullwidth),
                                Text(
                                  'Duduk sendiri',
                                  style: TextStyle(
                                    color: AppColors.txtPrimary,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          
                          
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'D',
                                  groupValue: state.gender,
                                  onChanged: (value) {
                                    context.read<KuisionerBloc>().add(
                                      PilAktivitasBayi(value!),
                                    );
                                  },
                                ),
                                SizedBox(width: sizewidth * 12 / fullwidth),
                                Text(
                                  'Merangkak',
                                  style: TextStyle(
                                    color: AppColors.txtPrimary,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'E',
                                  groupValue: state.gender,
                                  onChanged: (value) {
                                    context.read<KuisionerBloc>().add(
                                      PilAktivitasBayi(value!),
                                    );
                                  },
                                ),
                                SizedBox(width: sizewidth * 12 / fullwidth),
                                Text(
                                  'Berdiri dengan pengangan',
                                  style: TextStyle(
                                    color: AppColors.txtPrimary,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          
                          
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'F',
                                  groupValue: state.gender,
                                  onChanged: (value) {
                                    context.read<KuisionerBloc>().add(
                                      PilAktivitasBayi(value!),
                                    );
                                  },
                                ),
                                SizedBox(width: sizewidth * 12 / fullwidth),
                                Text(
                                  'Merespon terhadap suara',
                                  style: TextStyle(
                                    color: AppColors.txtPrimary,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          
                            Row(
                              children: [
                                Radio<String>(
                                  value: 'G',
                                  groupValue: state.gender,
                                  onChanged: (value) {
                                    context.read<KuisionerBloc>().add(
                                      PilAktivitasBayi(value!),
                                    );
                                  },
                                ),
                                SizedBox(width: sizewidth * 12 / fullwidth),
                                Text(
                                  'Bayi masi berusia dibawah 2 bulan',
                                  style: TextStyle(
                                    color: AppColors.txtPrimary,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                                            );
                                          },
                                        ),
                          
                                        SizedBox(height: sizeheight * 64 / fullheight),
                          
                                       
                          
                                        ButtonMedium(
                                          text: "Selesai",
                                          width: sizewidth * 327 / fullwidth,
                                          height: sizeheight * 45 / fullheight,
                                          backgroundColor: AppColors.txtPrimary,
                                          borderColor: AppColors.txtPrimary,
                                          onTap: () {
                                            //  Navigator.pushReplacement(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (_) => Beranda(),
                                            //   ),
                                            // );
                                          },
                                          radius: 15,
                                          txColor: AppColors.background,
                                        ),
                          
                                        SizedBox(height: sizeheight * 12 / fullheight),
                          
                                        ButtonMedium(
                                          text: "Kembali",
                                          width: sizewidth * 327 / fullwidth,
                                          height: sizeheight * 45 / fullheight,
                                          backgroundColor: AppColors.background,
                                          borderColor: AppColors.txtPrimary,
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                          
                                          radius: 15,
                                          txColor: AppColors.txtPrimary,
                                        ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
