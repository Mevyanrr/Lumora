import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lumora/core/theme/colors.dart';

class CardNextstep2 extends StatelessWidget {
  final Size size;
  final String title;
  final List<String> recommendations;
  final List<String> infos;

  const CardNextstep2({
    super.key,
    required this.size,
    required this.title,
    required this.recommendations,
    required this.infos,
  });

  @override
  Widget build(BuildContext context) {
    final sw = size.width;
    final sh = size.height;
    final fh = 917;
    final fw = 412;

    return Container(
      width: sw * 376 / fw,
      padding: EdgeInsets.all(sw * 16 / fw),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(sw * 16 / fw),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: sw * 18 / fw,
              fontWeight: FontWeight.w600,
              color: AppColors.txtPrimary,
            ),
          ),
          SizedBox(height: sh * 12 / fh),
          Column(
            children: List.generate(recommendations.length, (index) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/slim-lamp.svg',
                        width: sw * 20 / fw,
                      ),
                      SizedBox(width: sw * 8 / fw),
                      Expanded(
                        child: Text(
                          recommendations[index],
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: sw * 16 / fw,
                            fontWeight: FontWeight.w400,
                            color: AppColors.txtPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (index != recommendations.length - 1)
                    SizedBox(height: sw * 9 / fw),
                ],
              );
            }),
          ),
          SizedBox(height: sh * 16 / fh),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                spacing: sw * 12 / fw,
                runSpacing: sh * 8 / fh,
                children: infos.map((info) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        vertical: sh * 10 / fh, horizontal: sw * 16 / fw),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(sw * 24 / fw),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      info,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: sw * 14 / fw,
                        fontWeight: FontWeight.w500,
                        color: AppColors.txtPrimary,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
