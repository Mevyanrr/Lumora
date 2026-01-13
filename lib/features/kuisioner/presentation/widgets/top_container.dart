import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

class TopContainer extends StatelessWidget {
  final String stepPage;
  final String image;

  const TopContainer({
    super.key,
    required this.stepPage,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: sizeheight *35/fullheight,
            width: sizewidth*97/fullwidth,
            decoration: BoxDecoration(
              color: AppColors.yellowSemantic,
              borderRadius: BorderRadius.circular(31),
            ),
            child: Center(
              child: Text(
                stepPage,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColors.txtPrimary,
                ),
              ),
            ),
          ),
    
          SizedBox(height: sizeheight*32/fullheight ),
    
          Text(
            "Mari Kenali Si Kecil!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.txtPrimary,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
    
          SizedBox(height: sizeheight*8/fullheight ),
    
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sizewidth*18/fullwidth),
            child: Text(
              "Isi beberapa pertanyaan berikut agar kami bisa\n membantu  proses tumbuh kembang si kecil dengan\n baik.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.txtPrimary,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: sizewidth*14/fullwidth,
                height: 1.5,
              ),
            ),
          ),
    
          SizedBox(height: sizeheight*9/fullheight ),
    
          Image.asset(
            image,
            height: sizeheight* 151/fullheight,
            width: sizewidth* 202/fullwidth,
            fit: BoxFit.contain,
          ),
    
        
        ],
      ),
    );
  }
}
