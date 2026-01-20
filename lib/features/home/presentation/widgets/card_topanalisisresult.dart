import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumora/core/theme/colors.dart';

class CardTopanalisisresult extends StatelessWidget {
  final Size size;
  final String image;
  final String? icon;
  final String desc1;
  final String desc2;
  const CardTopanalisisresult({
    super.key,
    required this.size,
    required this.image,
    this.icon,
    required this.desc1,
    required this.desc2,
  });

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Text(
          "Hasil Analisis Makanan",
          style: TextStyle(
            fontSize: sizewidth * 22 / fullwidth,
            fontWeight: FontWeight.w600,
            color: AppColors.txtPrimary,
          ),
        ),

        SizedBox(height: sizeheight * 24 / fullheight),

        Image.asset(image),

        SizedBox(height: sizeheight * 12 / fullheight),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              SvgPicture.asset(icon!, width: sizewidth * 24 / fullwidth),
              SizedBox(width: sizewidth*3/fullwidth,),
            Text(
              desc1,
              style: TextStyle(
                fontSize: sizewidth * 18 / fullwidth,
                fontWeight: FontWeight.w500,
                color: AppColors.txtPrimary,
              ),
            ),
          ],
        ),

        Text(
          desc2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: sizewidth * 16 / fullwidth,
            fontWeight: FontWeight.w400,
            color: AppColors.txtPrimary,
          ),
        ),
      ],
    );
  }
}
