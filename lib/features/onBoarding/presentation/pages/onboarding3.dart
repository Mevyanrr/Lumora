import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/auth/presentation/pages/login.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: sizeheight * 154 / fullheight,
                width: sizewidth * 183 / fullwidth,
                fit: BoxFit.contain,
              ),
        
              SizedBox(height: sizeheight * 15 / fullheight),
        
              Text(
                "-Thoughtful Care for Growing Babies -\n“Because Every Little Step Matters”",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: sizewidth*14/fullwidth,
                  color: AppColors.txtPrimary,
                  height: 1.5,
                ),
              ),
        
              SizedBox(height: sizeheight * 34 / fullheight),
        
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Login()),
                  );
                },
                child: Column(
                  children: [
                    Text(
                      "Bergabung sekarang >",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: sizewidth*14/fullwidth,
                        color: AppColors.txtPrimary
                      ),
                    ),
                    SizedBox(height: sizeheight*5/fullheight,),
                    Container(
                      width: sizewidth*145/fullwidth, 
                      height: 1,
                      color: AppColors.txtSecondary,
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
