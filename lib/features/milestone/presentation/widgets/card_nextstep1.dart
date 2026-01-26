import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumora/core/theme/colors.dart';

class CardNextstep1 extends StatelessWidget {
  final Size size;
  final String desc;
  final String img;
  const CardNextstep1({
    super.key,
    required this.size,
    required this.desc,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return Container(
      // height: sizeheight * 153 / fullheight,
      width: sizewidth * 376 / fullwidth,
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizewidth * 16 / fullwidth,
          vertical: sizeheight * 12 / fullheight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/icons/nutriguide-warning.svg",
                    width: sizewidth * 30 / fullwidth),
                SizedBox(width: sizewidth * 6 / fullwidth),
                Text(
                  "Milestone terkait",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: sizewidth * 18 / fullwidth,
                    fontWeight: FontWeight.w500,
                    color: AppColors.txtPrimary,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: sizewidth * 180 / fullwidth,
                  // height: sizeheight * 66 / fullheight,
                  child: Text(
                    desc,
                    softWrap: true,
                    maxLines: null,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: sizewidth * 18 / fullwidth,
                      fontWeight: FontWeight.w500,
                      color: AppColors.txtPrimary,
                    ),
                  ),
                ),
                Image.asset(
                  img,
                  width: sizewidth * 149 / fullwidth,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
