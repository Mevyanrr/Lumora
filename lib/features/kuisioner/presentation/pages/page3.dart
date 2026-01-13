import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_bloc.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_event.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_state.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page4.dart';
import 'package:lumora/features/kuisioner/presentation/widgets/top_container.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

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
          padding: EdgeInsets.only(top: sizeheight * 77 / fullheight, bottom: sizeheight*61/fullheight),
          child: Column(
            children: [
              TopContainer(
                stepPage: "3 / 4",
                image: "assets/images/kuisioner-3.png",
              ),

              SizedBox(height: sizeheight * 30 / fullheight),

              
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: sizewidth*40/fullwidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Apakah bayi pernah mengalami kondisi berikut?",
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
                                      PilKondisiBayi(value!),
                                    );
                                  },
                                ),
                                
                                SizedBox(width: sizewidth * 12 / fullwidth),
                                Text(
                                  'Lahir prematur',
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
                                      PilKondisiBayi(value!),
                                    );
                                  },
                                ),
                                SizedBox(width: sizewidth * 12 / fullwidth),
                                Text(
                                  'Berat lahir rendah',
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
                                      PilKondisiBayi(value!),
                                    );
                                  },
                                ),
                                SizedBox(width: sizewidth * 12 / fullwidth),
                                Text(
                                  'Riwayat kejang',
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
                          
                                        SizedBox(height: sizeheight * 24 / fullheight),
                          
                                        Text(
                                          "Apakah bayi rutin kontrol ke tenaga kesehatan?",
                                          style: TextStyle(
                                            color: AppColors.txtPrimary,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                        ),
                          
                                        BlocBuilder<KuisionerBloc, KuisionerState>(
                                          builder: (context, state) {
                                            return Row(
                          children: [
                            Radio<String>(
                              value: 'A',
                              groupValue: state.gender,
                              onChanged: (value) {
                                context.read<KuisionerBloc>().add(PilKontrol(value!));
                              },
                            ),
                          
                            Text(
                              'Ya',
                              style: TextStyle(
                                color: AppColors.txtPrimary,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          
                            SizedBox(width: sizewidth * 44 / fullwidth),
                          
                            Radio<String>(
                              value: 'B',
                              groupValue: state.gender,
                              onChanged: (value) {
                                context.read<KuisionerBloc>().add(PilKontrol(value!));
                              },
                            ),
                            Text(
                              'Tidak',
                              style: TextStyle(
                                color: AppColors.txtPrimary,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                                            );
                                          },
                                        ),
                          
                                        SizedBox(height: sizeheight * 54 / fullheight),
                          
                                        ButtonMedium(
                                          text: "Lanjutkan",
                                          width: sizewidth * 327 / fullwidth,
                                          height: sizeheight * 45 / fullheight,
                                          backgroundColor: AppColors.txtPrimary,
                                          borderColor: AppColors.txtPrimary,
                                          onTap: () {
                                            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Page4()),
                                            );
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
