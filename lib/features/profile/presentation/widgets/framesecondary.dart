import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lumora/core/theme/colors.dart';

class Framesecondary extends StatelessWidget {
  final Size size;
  final String icon;
  final String title;

  const Framesecondary({super.key,
  required this.size,
  required this.icon,
  required this.title,

  });

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: sizeheight * 12 / fullheight,
        horizontal: sizewidth * 13 / fullwidth,
      ),
      height: sizeheight * 56 / fullheight,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(sizewidth * 12 / fullwidth),
        color: AppColors.primaryOrange,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
          ),
    
          SizedBox(width:sizewidth* 16/fullwidth),
    
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize:sizewidth* 16/fullwidth,
                fontWeight: FontWeight.w400,
                color: AppColors.txtPrimary
              ),
            ),
          ),
        ],
      ),
    );
  }
}