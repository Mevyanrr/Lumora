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
import 'package:lumora/features/kuisioner/presentation/pages/page2.dart';
import 'package:lumora/features/kuisioner/presentation/widgets/top_container.dart';
import 'package:lumora/core/widgets/textfield.dart';

class Page1View extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController dateController;

  const Page1View({
    super.key,
    required this.nameController,
    required this.dateController,
  });

  @override
  State<Page1View> createState() => _Page1ViewState();
}

class _Page1ViewState extends State<Page1View> {
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
                  stepPage: "1 / 4",
                  image: "assets/images/kuisioner-1.png",
                ),
        
                SizedBox(height: sizeheight * 30 / fullheight),
        
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Bayi",
                        style: TextStyle(
                          color: AppColors.txtPrimary,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: sizewidth*18/fullwidth,
                        ),
                      ),
                      SizedBox(height: sizeheight * 9 / fullheight),
                      CustomTxtField(
                        labelText: "Masukkan nama bayi...",
                        controller: widget.nameController,
                        onChanged: (value) {
                          context.read<KuisionerBloc>().add(IsiNama(value));
                        },
                      ),
                      SizedBox(height: sizeheight * 12 / fullheight),
                      Text(
                        "Tanggal Lahir",
                        style: TextStyle(
                          color: AppColors.txtPrimary,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: sizewidth*18/fullwidth,
                        ),
                      ),
        
                      SizedBox(height: sizeheight * 9 / fullheight),
        
                      CustomTxtField(
                        labelText: "DD/MM/YYYY",
                        controller: widget.dateController,
                        fieldType: CustomFieldType.date,
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          color: AppColors.txtPrimary,
                        ),
                        onDateSelected: (date) {
                          context.read<KuisionerBloc>().add(IsiTglLahir(date));
                        },
                      ),
        
                      SizedBox(height: sizeheight * 24 / fullheight),
        
                      Text(
                        "Jenis Kelamin",
                        style: TextStyle(
                          color: AppColors.txtPrimary,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: sizewidth*18/fullwidth,
                        ),
                      ),
        
                      BlocBuilder<KuisionerBloc, KuisionerState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              Radio<String>(
                                value: 'L',
                                groupValue: state.gender,
                                onChanged: (value) {
                                  context.read<KuisionerBloc>().add(
                                    IsiGender(value!),
                                  );
                                },
                              ),
                              Text(
                                'Laki-laki',
                                style: TextStyle(
                                  color: AppColors.txtPrimary,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: sizewidth*16/fullwidth,
                                ),
                              ),
        
                              SizedBox(width: sizewidth * 24 / fullwidth),
        
                              Radio<String>(
                                value: 'P',
                                groupValue: state.gender,
                                onChanged: (value) {
                                  context.read<KuisionerBloc>().add(
                                    IsiGender(value!),
                                  );
                                },
                              ),
                              Text(
                                'Perempuan',
                                style: TextStyle(
                                  color: AppColors.txtPrimary,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: sizewidth*16/fullwidth,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
        
                      SizedBox(height: sizeheight * 56 / fullheight),
        
                      ButtonMedium(
                        text: "Lanjutkan",
                        width: sizewidth * 327 / fullwidth,
                        height: sizeheight * 45 / fullheight,
                        backgroundColor: AppColors.txtPrimary,
                        borderColor: AppColors.txtPrimary,
<<<<<<< HEAD
                        onTap: () async{
                          final User? user = FirebaseAuth.instance.currentUser;
                          try{
                            
                          } catch(e){

                          }
                          Navigator.push(

=======
                        onTap: () {
                          Navigator.push(
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                            context,
                            MaterialPageRoute(builder: (_) => Page2()),
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
                        onTap: () {},
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
