import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CardPanduanGizi extends StatelessWidget {
  final String title;
  final String portion;
  final String imagePath;
  final Size size;
  final VoidCallback? onTap;

  const CardPanduanGizi({
    super.key,
    required this.title,
    required this.portion,
    required this.imagePath,
    required this.size,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final sizeheight = size.height;
    final double fullheight = 917;
    final double fullwidth = 412;
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
            _buildImage(sizewidth, fullwidth),
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

  Widget _buildImage(double sizeWidth, double fullwidth) {
    final double imageSize = sizeWidth * 35 / fullwidth;
    if(imagePath.toLowerCase().endsWith('.svg')){
      return SvgPicture.asset(
        imagePath,
        width: imageSize,
        height: imageSize,
        placeholderBuilder: (BuildContext context) => Icon(Icons.error, color: Colors.red),
      );
    } else {
      return Image.asset(
        imagePath,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported),
      );
    }
  }
}
