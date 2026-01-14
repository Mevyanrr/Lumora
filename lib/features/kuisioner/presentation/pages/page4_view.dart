<<<<<<< HEAD
import 'package:firebase_auth/firebase_auth.dart';
=======
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_bloc.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_event.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_state.dart';
import 'package:lumora/features/kuisioner/presentation/widgets/top_container.dart';
<<<<<<< HEAD
import 'package:lumora/features/kuisioner/services/kuisioner_service.dart';
import 'package:lumora/features/onBoarding/presentation/pages/onBoarding.dart';
import 'package:lumora/model/baby_model.dart';
=======
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0

class Page4View extends StatefulWidget {
  final TextEditingController aktivitasBayiController;

  const Page4View({
    super.key,
    required this.aktivitasBayiController,
  });

  @override
  State<Page4View> createState() => _Page4ViewState();
}

class _Page4ViewState extends State<Page4View> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: sizeheight * 77 / fullheight, bottom: sizeheight*61/fullheight),
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
                                fontSize: sizewidth*18/fullwidth,
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
<<<<<<< HEAD
                                    value: 'Tengkurap',
=======
                                    value: 'A',
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                                    groupValue: state.aktivitasBayi,
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
                                      fontSize: sizewidth*16/fullwidth,
                                    ),
                                  ),
                                ],
                              ),
                            
                              Row(
                                children: [
                                  Radio<String>(
<<<<<<< HEAD
                                    value: 'Duduk dengan bantuan',
=======
                                    value: 'B',
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                                    groupValue: state.aktivitasBayi,
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
                                      fontSize: sizewidth*16/fullwidth,
                                    ),
                                  ),
                                ],
                              ),
                            
                              Row(
                                children: [
                                  Radio<String>(
<<<<<<< HEAD
                                    value: 'Duduk sendiri',
=======
                                    value: 'C',
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                                    groupValue: state.aktivitasBayi,
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
                                      fontSize: sizewidth*16/fullwidth,
                                    ),
                                  ),
                                ],
                              ),
                            
                            
                              Row(
                                children: [
                                  Radio<String>(
<<<<<<< HEAD
                                    value: 'Merangkak',
=======
                                    value: 'D',
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                                    groupValue: state.aktivitasBayi,
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
                                      fontSize: sizewidth*16/fullwidth,
                                    ),
                                  ),
                                ],
                              ),
                            
                              Row(
                                children: [
                                  Radio<String>(
<<<<<<< HEAD
                                    value: 'Berdiri dengan pengangan',
=======
                                    value: 'E',
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                                    groupValue: state.aktivitasBayi,
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
                                      fontSize: sizewidth*16/fullwidth,
                                    ),
                                  ),
                                ],
                              ),
                            
                            
                              Row(
                                children: [
                                  Radio<String>(
<<<<<<< HEAD
                                    value: 'Merespon terhadap suara',
=======
                                    value: 'F',
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                                    groupValue: state.aktivitasBayi,
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
                                      fontSize: sizewidth*16/fullwidth,
                                    ),
                                  ),
                                ],
                              ),
                            
                              Row(
                                children: [
                                  Radio<String>(
<<<<<<< HEAD
                                    value: 'Bayi masi berusia dibawah 2 bulan',
=======
                                    value: 'G',
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                                    groupValue: state.aktivitasBayi,
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
                                      fontSize: sizewidth*16/fullwidth,
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
<<<<<<< HEAD
                                            onTap: () async{
                                            final finalState = context.read<KuisionerBloc>().state;
                                            final User? user = FirebaseAuth.instance.currentUser;
                                            BabyModel babyModel = BabyModel(
                                              nama: finalState.nama, 
                                              tanggalLahir: finalState.tanggalLahir ?? DateTime.timestamp(),
                                              jenisKelamin: finalState.gender,
                                              beratBadan: finalState.bb, 
                                              tinggiBadan: finalState.tb, 
                                              lingkarKepala: finalState.lingkarKepala, 
                                              riwayatKesehatan: finalState.kondisiBayi, 
                                              kontrol: finalState.pilKontrol, 
                                              kondisi: finalState.aktivitasBayi, 
                                              createdAt: DateTime.now());
                                              
                                              print("BB: ${finalState.bb}");
                                              await KuisionerService().saveKuisionerData(babyModel);
                                            Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                        builder: (_) => Onboarding(),
                                        ),
                                          );
=======
                                            onTap: () {
                                              //  Navigator.pushReplacement(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (_) => Beranda(),
                                              //   ),
                                              // );
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
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
      ),
    );
  }
}
