import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';

class CardInfokesehatan extends StatelessWidget {
  final String title;
  final String desc;
  final String imagePath;
  final VoidCallback onTap;
  final Size size;

  const CardInfokesehatan({
    super.key,
    required this.title,
    required this.desc,
    required this.imagePath,
    required this.size,
     required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return  Container(
        width: sizewidth* 188/fullwidth,
        height: sizeheight* 242/fullheight,
        padding: EdgeInsets.all(sizewidth*12/fullwidth),
        decoration: BoxDecoration(
          color: AppColors.primaryOrange,
          borderRadius: BorderRadius.circular(sizewidth*24/fullwidth),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: sizeheight* 69/fullheight,
              fit: BoxFit.contain,
            ),
            SizedBox(height:sizeheight* 6/fullheight),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: sizewidth* 16/fullwidth,
                fontWeight: FontWeight.w700,
                color: AppColors.secondary
              ),
            ),
            SizedBox(height:sizeheight* 4/fullheight),
            Text(
                desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                  fontSize: sizewidth* 12/fullwidth,
                  color: AppColors.txtPrimary,
                  fontWeight: FontWeight.w400
                ),
              ),

            SizedBox(height:sizeheight* 8/fullheight),
            ButtonMedium(text: "Lanjutkan", width: sizewidth*150/fullwidth, height: sizeheight* 35/fullheight, backgroundColor: AppColors.txtPrimary, borderColor: AppColors.txtPrimary, onTap:onTap, radius: sizewidth*50/fullwidth, txColor: AppColors.background)
          ],
        ),
    );
  }
}