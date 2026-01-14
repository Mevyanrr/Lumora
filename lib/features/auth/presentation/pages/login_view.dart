<<<<<<< HEAD
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
=======
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';
import 'package:lumora/features/auth/presentation/pages/regist.dart';
<<<<<<< HEAD
import 'package:lumora/features/auth/services/auth_services.dart';
=======
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_bloc.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_event.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page1.dart';
import 'package:lumora/core/widgets/textfield.dart';

class LoginView extends StatefulWidget {
  final TextEditingController namauserController;
  final TextEditingController emailController;
  final TextEditingController pwController;

  const LoginView({
    super.key,
    required this.namauserController,
    required this.emailController,
    required this.pwController,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
<<<<<<< HEAD
    bool isLoading = false;
=======
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: sizeheight * 115 / fullheight,
              bottom: sizeheight * 67 / fullheight,
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hallo Parents!",
                          style: TextStyle(
                            fontFamily: 'Poppins',
<<<<<<< HEAD
                            fontSize: sizewidth*28/fullwidth,
=======
                            fontSize: sizewidth * 28 / fullwidth,
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                            fontWeight: FontWeight.w600,
                            color: AppColors.txtPrimary,
                          ),
                        ),
                        SizedBox(width: sizewidth * 7 / fullwidth),
                        SvgPicture.asset("assets/icons/star.svg", width: 28.5),
                      ],
                    ),
                    Text(
                      "Selamat datang kembali",
                      style: TextStyle(
                        fontFamily: 'Poppins',
<<<<<<< HEAD
                        fontSize: sizewidth*18/fullwidth,
=======
                        fontSize: sizewidth * 18 / fullwidth,
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                        fontWeight: FontWeight.w500,
                        color: AppColors.txtPrimary,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 62),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama",
                        style: TextStyle(
                          color: AppColors.txtPrimary,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
<<<<<<< HEAD
                          fontSize: sizewidth*18/fullwidth,
                        ),
                      ),
                      SizedBox(height: sizeheight * 9 / fullheight),
        
=======
                          fontSize: sizewidth * 18 / fullwidth,
                        ),
                      ),
                      SizedBox(height: sizeheight * 9 / fullheight),

>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                      CustomTxtField(
                        labelText: "Masukkan nama anda...",
                        controller: widget.namauserController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama wajib diisi';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: sizeheight * 16 / fullheight),
<<<<<<< HEAD
        
=======

>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                      Text(
                        "Email",
                        style: TextStyle(
                          color: AppColors.txtPrimary,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
<<<<<<< HEAD
                          fontSize: sizewidth*18/fullwidth,
=======
                          fontSize: sizewidth * 18 / fullwidth,
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                        ),
                      ),
                      SizedBox(height: sizeheight * 9 / fullheight),
                      CustomTxtField(
                        labelText: "Masukkan email anda...",
                        fieldType: CustomFieldType.email,
                        controller: widget.emailController,
                        //onChanged: ,
                      ),
                      SizedBox(height: sizeheight * 16 / fullheight),
<<<<<<< HEAD
        
=======

>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                      Text(
                        "Kata sandi",
                        style: TextStyle(
                          color: AppColors.txtPrimary,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
<<<<<<< HEAD
                          fontSize: sizewidth*18/fullwidth,
=======
                          fontSize: sizewidth * 18 / fullwidth,
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                        ),
                      ),
                      SizedBox(height: sizeheight * 9 / fullheight),
                      CustomTxtField(
                        labelText: "Masukkan kata sandi...",
                        controller: widget.pwController,
                        onChanged: (value) {
                          context.read<KuisionerBloc>().add(IsiNama(value));
                        },
                      ),
                      SizedBox(height: sizeheight * 8 / fullheight),
                      GestureDetector(
                        // onTap: () {
                        //    Navigator.push(
                        //      context,
                        //      MaterialPageRoute(builder: (_) => Page1()),
                        //    );
                        // },
                        child: Text(
                          "Lupa kata sandi?",
                          style: TextStyle(
<<<<<<< HEAD
                            fontSize: sizewidth*14/fullwidth,
=======
                            fontSize: sizewidth * 14 / fullwidth,
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: AppColors.txtPrimary,
                          ),
                        ),
                      ),
<<<<<<< HEAD
        
                      SizedBox(height: sizeheight * 51 / fullheight),
        
=======

                      SizedBox(height: sizeheight * 51 / fullheight),

>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                      ButtonMedium(
                        text: "Masuk",
                        width: sizewidth * 327 / fullwidth,
                        height: sizeheight * 45 / fullheight,
                        backgroundColor: AppColors.txtPrimary,
                        borderColor: AppColors.txtPrimary,
<<<<<<< HEAD
                        onTap: () async{
                           final nama = widget.namauserController.text.trim();
                            final email = widget.emailController.text.trim();
                            final password = widget.pwController.text.trim();
        
                            if (nama.isEmpty ||
                                email.isEmpty ||
                                password.isEmpty ) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Semua form wajib diisi!"),
                                ),
                              );
                              return;
                            } 
                          setState(() {
                              isLoading = true;
                            });
                            try{
                              await AuthService().signInWithEmailAndPassword(name: nama, email: email, password: password);
                              await AuthService().saveUserToFirestore(AuthService().currentUser!, nama);
                              if(!mounted) return;
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Page1()),
                            );
                            } catch(e){
                              log("error regist: $e");
                            } finally {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          
                        },
        
                        radius: 15,
                        txColor: AppColors.background,
                      ),
        
                      SizedBox(height: sizeheight * 35 / fullheight),
                      Row(
                        children: [
                          Container(
                            width: sizewidth * 70 / fullwidth,
                            height: 1,
                            color: AppColors.txtSecondary,
=======
                        onTap: () {
                          final nama = widget.namauserController.text.trim();
                          final email = widget.emailController.text.trim();
                          final password = widget.pwController.text.trim();

                          if (nama.isEmpty ||
                              email.isEmpty ||
                              password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Semua form wajib diisi!"),
                              ),
                            );
                            return;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Page1(),
                            ), // KE HOMEPAGE
                          );
                        },

                        radius: 15,
                        txColor: AppColors.background,
                      ),

                      SizedBox(height: sizeheight * 35 / fullheight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppColors.txtSecondary,
                            ),
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                          ),
                          SizedBox(width: sizewidth * 12 / fullwidth),
                          Text(
                            "Atau masuk dengan",
                            style: TextStyle(
<<<<<<< HEAD
                              fontSize: sizewidth*14/fullwidth,
=======
                              fontSize: sizewidth * 14 / fullwidth,
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: AppColors.txtPrimary,
                            ),
                          ),
                          SizedBox(width: sizewidth * 12 / fullwidth),
<<<<<<< HEAD
                          Container(
                            width: sizewidth * 70 / fullwidth,
                            height: 1,
                            color: AppColors.txtSecondary,
                          ),
                        ],
                      ),
        
                      SizedBox(height: sizeheight * 24 / fullheight),
        
                      Center(
                        child: GestureDetector(
                          onTap: () async{
                            setState(() {
                              isLoading = true;
                            });
                            try{
                              final userCredential = await AuthService().signInWithGoogle();
                              await AuthService().saveUserToFirestore(userCredential!.user!, userCredential.user!.displayName?? "");
                              if(!mounted) return;
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (_) => Page1()));
                            } catch(e){
                              log("error google sign in: $e");
                            } finally {
                              setState(() {
                                isLoading = false;
                              });
                            }
=======
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppColors.txtSecondary,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: sizeheight * 24 / fullheight),

                      Center(
                        child: GestureDetector(
                          onTap: () {
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (_) => Page1()),
                            // );
                          },
                          child: SvgPicture.asset(
                            "assets/icons/google.svg",
<<<<<<< HEAD
                            width:sizewidth* 38/fullwidth,
                          ),
                        ),
                      ),
        
                      SizedBox(height: sizeheight * 75 / fullheight),
        
=======
                            width: sizewidth * 38 / fullwidth,
                          ),
                        ),
                      ),

                      SizedBox(height: sizeheight * 75 / fullheight),

>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Belum punya akun?",
                            style: TextStyle(
<<<<<<< HEAD
                              fontSize: sizewidth*14/fullwidth,
=======
                              fontSize: sizewidth * 14 / fullwidth,
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: AppColors.txtPrimary,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => Regist()),
                              );
                            },
                            child: Text(
                              " Daftar",
                              style: TextStyle(
<<<<<<< HEAD
                                fontSize: sizewidth*14/fullwidth,
=======
                                fontSize: sizewidth * 14 / fullwidth,
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ),
                        ],
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
