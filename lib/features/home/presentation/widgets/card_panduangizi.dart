import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

class CardPanduanGizi extends StatelessWidget {
  final String title;
  final String portion;
  final String imagePath;
  final VoidCallback? onTap;

  const CardPanduanGizi({
    super.key,
    required this.title,
    required this.portion,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizewidth* 92/fullwidth,
        height: sizeheight* 115/fullheight,
        padding: EdgeInsets.symmetric(horizontal: sizewidth*10/fullwidth
        , vertical: sizeheight*10/fullheight),
        decoration: BoxDecoration(
          color: AppColors.primaryOrange,
          borderRadius: BorderRadius.circular(sizewidth*16/fullwidth),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: sizeheight* 36/fullheight,
              fit: BoxFit.contain,
            ),
            SizedBox(height:sizeheight* 8/fullheight),
            Text(
              title,
              style: TextStyle(
                fontSize: sizewidth* 16/fullwidth,
                fontWeight: FontWeight.w500,
                color: AppColors.txtPrimary
              ),
            ),
            SizedBox(height:sizeheight* 4/fullheight),
            Text(
              portion,
              style: TextStyle(
                fontSize: sizewidth* 12/fullwidth,
                color: AppColors.txtPrimary,
                fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      ),
    );
  }
}
