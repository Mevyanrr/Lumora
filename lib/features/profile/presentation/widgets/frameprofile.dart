import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

class Frameprofile extends StatelessWidget {
  final Size size;
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const Frameprofile({
    super.key,
    required this.size,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: sizeheight * 12 / fullheight,
          horizontal: sizewidth * 13 / fullwidth,
        ),
        width: sizewidth * 346 / fullwidth,
        height: sizeheight * 64 / fullheight,
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sizewidth * 12 / fullwidth),
          color: AppColors.primaryOrange,
        ),
        child: Row(
          children: [
            Container(
              width:sizewidth* 40/fullwidth,
              height:sizeheight* 40/fullheight,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.txtPrimary,
              ),
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

            Icon(
              Icons.chevron_right,
              size:sizewidth* 24/fullwidth,
              color: AppColors.txtPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
