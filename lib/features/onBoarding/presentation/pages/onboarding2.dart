import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

   @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sw = size.width;
    final sh = size.height;

    const fw = 412;
    const fh = 917;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: sh * 265 / fh),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [

                SizedBox(
                  height: sh * 154 / fh,
                  width: sw * 183 / fw,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: sh * 15 / fh),

                SizedBox(
                  height: sh * 45 / fh, 
                  child: Text(
                    "-Thoughtful Care for Growing Babies -\n"
                    "“Because Every Little Step Matters”",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: sw * 14 / fw,
                      color: AppColors.txtPrimary,
                      height: 1.5,
                    ),
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
