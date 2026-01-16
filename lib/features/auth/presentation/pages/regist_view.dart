import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';
import 'package:lumora/features/auth/presentation/pages/login.dart';
import 'package:lumora/features/auth/services/auth_services.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page1.dart';
import 'package:lumora/core/widgets/textfield.dart';

class RegistView extends StatefulWidget {
  final TextEditingController namauserController;
  final TextEditingController emailController;
  final TextEditingController pwController;
  final TextEditingController konfirmpwController;

  const RegistView({
    super.key,
    required this.namauserController,
    required this.emailController,
    required this.pwController,
    required this.konfirmpwController,
  });

  @override
  State<RegistView> createState() => _RegistViewState();
}

class _RegistViewState extends State<RegistView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    bool isLoading = false;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: sizeheight * 61 / fullheight,
              bottom: sizeheight * 61 / fullheight,
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
                            fontSize: sizewidth * 28 / fullwidth,
                            fontWeight: FontWeight.w600,
                            color: AppColors.txtPrimary,
                          ),
                        ),
                        SizedBox(width: sizewidth * 7 / fullwidth),
                        SvgPicture.asset("assets/icons/star.svg", width: 28.5),
                      ],
                    ),
                    Text(
                      "Mari bergabung dan pantau tumbuh\nkembang Si Kecil!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: sizewidth * 18 / fullwidth,
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
                          fontSize: sizewidth * 18 / fullwidth,
                        ),
                      ),
                      SizedBox(height: sizeheight * 9 / fullheight),
                      CustomTxtField(
                        labelText: "Masukkan nama anda...",
                        controller: widget.namauserController,
                        // onChanged: (value) {
                        //   context.read<KuisionerBloc>().add(IsiNama(value));
                        // },
                      ),
                      SizedBox(height: sizeheight * 16 / fullheight),

                      Text(
                        "Email",
                        style: TextStyle(
                          color: AppColors.txtPrimary,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: sizewidth * 18 / fullwidth,
                        ),
                      ),
                      SizedBox(height: sizeheight * 9 / fullheight),
                      CustomTxtField(
                        labelText: "Masukkan email anda...",
                        fieldType: CustomFieldType.email,
                        controller: widget.emailController,
                      ),
                      SizedBox(height: sizeheight * 16 / fullheight),

                      Text(
                        "Kata sandi",
                        style: TextStyle(
                          color: AppColors.txtPrimary,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: sizewidth * 18 / fullwidth,
                        ),
                      ),
                      SizedBox(height: sizeheight * 9 / fullheight),
                      CustomTxtField(
                        labelText: "Maukkan kata sandi...",
                        controller: widget.pwController,
                      ),

                      SizedBox(height: sizeheight * 16 / fullheight),

                      Text(
                        "Konfirmasi kata sandi",
                        style: TextStyle(
                          color: AppColors.txtPrimary,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: sizewidth * 18 / fullwidth,
                        ),
                      ),
                      SizedBox(height: sizeheight * 9 / fullheight),
                      CustomTxtField(
                        labelText: "Konfirmasi kata sandi anda...",
                        controller: widget.konfirmpwController,
                        // onChanged: (value) {
                        //   context.read<KuisionerBloc>().add(IsiNama(value));
                        // },
                      ),

                      SizedBox(height: sizeheight * 46 / fullheight),

                      ButtonMedium(
                        text: "Masuk",
                        width: sizewidth * 327 / fullwidth,
                        height: sizeheight * 45 / fullheight,
                        backgroundColor: AppColors.txtPrimary,
                        borderColor: AppColors.txtPrimary,
                        onTap: () async {
                          final nama = widget.namauserController.text.trim();
                          final email = widget.emailController.text.trim();
                          final password = widget.pwController.text.trim();
                          final konfirmPassword = widget
                              .konfirmpwController
                              .text
                              .trim();

                          if (nama.isEmpty ||
                              email.isEmpty ||
                              password.isEmpty ||
                              konfirmPassword.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Semua form wajib diisi!"),
                              ),
                            );
                            return;
                          }

                          if (!email.contains('@') || !email.contains('.com')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Email harus mengandung '@' dan 'gmail.com'",
                                ),
                              ),
                            );
                            return;
                          }

                          if (password.length < 6 ||
                              !RegExp(r'[A-Z]').hasMatch(password) ||
                              !RegExp(r'[a-z]').hasMatch(password) ||
                              !RegExp(r'[0-9]').hasMatch(password)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Password min 6 karakter, ada huruf besar, kecil, dan angka!",
                                ),
                              ),
                            );

                            if (konfirmPassword != password) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "konfirmasi password dan password berbeda",
                                  ),
                                ),
                              );
                              return;
                            }

                            return;
                          }

                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await AuthService().createUser(
                              name: nama,
                              email: email,
                              password: password,
                              confirmPassword: konfirmPassword,
                            );
                            await AuthService().saveUserToFirestore(
                              AuthService().currentUser!,
                              nama,
                            );
                            if (!mounted) return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Page1()),
                            );
                          } on FirebaseAuthException catch (e) {
                            String message = "Terjadi kesalahan";
                            if (e.code == 'email-already-in-box' ||
                                e.code == 'email-already-in-use') {
                              message =
                                  "Akun dengan email tersebut sudah terdaftar";
                            } else if (e.code == 'weak-password') {
                              message = "Password terlalu lemah";
                            } else if (e.code == 'invalid-email') {
                              message = "Format email tidak valid";
                            }
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(message)));
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
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppColors.txtSecondary,
                            ),
                          ),

                          SizedBox(width: sizewidth * 12 / fullwidth),

                          Text(
                            "Atau masuk dengan",
                            style: TextStyle(
                              fontSize: sizewidth * 14 / fullwidth,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: AppColors.txtPrimary,
                            ),
                          ),

                          SizedBox(width: sizewidth * 12 / fullwidth),

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
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              final userCredential = await AuthService()
                                  .signInWithGoogle();
                              await AuthService().saveUserToFirestore(
                                userCredential!.user!,
                                userCredential.user!.displayName ?? "",
                              );
                              if (!mounted) return;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => Page1()),
                              );
                            } catch (e) {
                              log("error google sign in: $e");
                            } finally {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },

                          child: SvgPicture.asset(
                            "assets/icons/google.svg",
                            width: sizewidth * 38 / fullwidth,
                          ),
                        ),
                      ),

                      SizedBox(height: sizeheight * 47 / fullheight),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sudah punya akun?",
                            style: TextStyle(
                              fontSize: sizewidth * 14 / fullwidth,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: AppColors.txtPrimary,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => Login()),
                              );
                            },
                            child: Text(
                              " Login",
                              style: TextStyle(
                                fontSize: sizewidth * 14 / fullwidth,
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
