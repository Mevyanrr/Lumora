import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';
import 'package:lumora/features/auth/presentation/pages/login.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_bloc.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_event.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_state.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page1.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page3_view.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page3_view.dart';
import 'package:lumora/features/kuisioner/presentation/widgets/top_container.dart';
import 'package:lumora/core/widgets/textfield.dart';

class RegistView extends StatefulWidget {
  final TextEditingController namauserController;
  final TextEditingController emailController;
  final TextEditingController pwController;

  const RegistView({
    super.key,
    required this.namauserController,
    required this.emailController,
    required this.pwController,
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
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: sizeheight * 91 / fullheight,
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
                          fontSize: 28,
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
                      fontSize: 18,
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
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: sizeheight * 9 / fullheight),
                    CustomTxtField(
                      labelText: "Masukkan nama anda...",
                      controller: widget.namauserController,
                      onChanged: (value) {
                        context.read<KuisionerBloc>().add(IsiNama(value));
                      },
                    ),
                    SizedBox(height: sizeheight * 16 / fullheight),

                    Text(
                      "Email",
                      style: TextStyle(
                        color: AppColors.txtPrimary,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: sizeheight * 9 / fullheight),
                    CustomTxtField(
                      labelText: "Masukkan email anda...",
                      controller: widget.emailController,
                      onChanged: (value) {
                        context.read<KuisionerBloc>().add(IsiNama(value));
                      },
                    ),
                    SizedBox(height: sizeheight * 16 / fullheight),

                    Text(
                      "Kata sandi",
                      style: TextStyle(
                        color: AppColors.txtPrimary,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: sizeheight * 9 / fullheight),
                    CustomTxtField(
                      labelText: "Maukkan kata sandi...",
                      controller: widget.pwController,
                      onChanged: (value) {
                        context.read<KuisionerBloc>().add(IsiNama(value));
                      },
                    ),

                    SizedBox(height: sizeheight * 16 / fullheight),

                    Text(
                      "Konfirmasi kata sandi",
                      style: TextStyle(
                        color: AppColors.txtPrimary,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: sizeheight * 9 / fullheight),
                    CustomTxtField(
                      labelText: "Konfirmasi kata sandi anda...",
                      controller: widget.pwController,
                      onChanged: (value) {
                        context.read<KuisionerBloc>().add(IsiNama(value));
                      },
                    ),

                    SizedBox(height: sizeheight * 46 / fullheight),

                    ButtonMedium(
                      text: "Masuk",
                      width: sizewidth * 327 / fullwidth,
                      height: sizeheight * 45 / fullheight,
                      backgroundColor: AppColors.txtPrimary,
                      borderColor: AppColors.txtPrimary,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Page1()),
                        );
                      },

                      radius: 15,
                      txColor: AppColors.background,
                    ),

                    SizedBox(height: sizeheight * 35 / fullheight),
                    Row(
                      children: [
                        Container(
                          width: sizewidth * 82 / fullwidth,
                          height: 1,
                          color: AppColors.txtSecondary,
                        ),
                        SizedBox(width: sizewidth * 12 / fullwidth),
                        Text(
                          "Atau masuk dengan",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: AppColors.txtPrimary,
                          ),
                        ),
                        SizedBox(width: sizewidth * 12 / fullwidth),
                        Container(
                          width: sizewidth * 82 / fullwidth,
                          height: 1,
                          color: AppColors.txtSecondary,
                        ),
                      ],
                    ),

                    SizedBox(height: sizeheight * 24 / fullheight),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (_) => Page1()),
                          // );
                        },
                        child: SvgPicture.asset(
                          "assets/icons/google.svg",
                          width: 38,
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
                            fontSize: 14,
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
                              fontSize: 14,
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
    );
  }
}
