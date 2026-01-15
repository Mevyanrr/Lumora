import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumora/core/theme/colors.dart';

class CardHiparents extends StatelessWidget {
  final String desc;
  final Size size;
  const CardHiparents({super.key, required this.desc, required this.size});

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return Container(
      height: sizeheight * 146 / fullheight,
      width: sizewidth * 376 / fullwidth,
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: sizewidth * 16 / fullwidth,
          vertical: sizeheight * 12 / fullheight,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hi, Parents!",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: sizewidth * 18 / fullwidth,
                        fontWeight: FontWeight.w500,
                        color: AppColors.txtPrimary,
                      ),
                    ),
                    SizedBox(width: sizewidth * 5 / fullwidth),
                    SvgPicture.asset("assets/icons/star.svg", width: 20),
                  ],
                ),
                SizedBox(
                  width: sizewidth * 213 / fullwidth,
                  height: sizeheight * 66 / fullheight,
                  child: Text(
                    desc,
                    softWrap: true,
                    maxLines: null,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: sizewidth * 14 / fullwidth,
                      fontWeight: FontWeight.w400,
                      color: AppColors.txtPrimary,
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              "assets/images/baby-homepage.png",
              width: sizewidth * 122 / fullwidth,
            ),
          ],
        ),
      ),
    );
  }
}
