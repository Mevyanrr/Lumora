import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumora/core/theme/colors.dart';

class CardAktivitas extends StatelessWidget {
  final Size size;
  final int count;
  final String title;
  final String icon;

  const CardAktivitas(
      {super.key,
      required this.size,
      required this.count,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    final sw = size.width;
    final sh = size.height;
    final fh = 917;
    final fw = 412;
    return Container(
      width: sw * 118 / fw,
      height: sh * 72 / fh,
      padding: EdgeInsets.symmetric(
          horizontal: sw * 10 / fw, vertical: sh * 12 / fh),
      decoration: BoxDecoration(
          color: AppColors.primaryOrange,
          borderRadius: BorderRadius.circular(sw * 20 / fw)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: sw * 35 / fw,
            height: sh * 35 / fh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.yellowSemantic,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: sw * 27 / fw,
                height: sw * 27 / fw,
                colorFilter: ColorFilter.mode(
                  AppColors.primaryOrange,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(
            width: sw * 4 / fw,
          ),
          Column(
            children: [
              Text(
                count.toString(),
                style: TextStyle(
                    fontSize: sw * 18 / fw,
                    fontWeight: FontWeight.w500,
                    color: AppColors.txtPrimary),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: sw * 14 / fw,
                    fontWeight: FontWeight.w400,
                    color: AppColors.txtPrimary),
              ),
            ],
          )
        ],
      ),
    );
  }
}
