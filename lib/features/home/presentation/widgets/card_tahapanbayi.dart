import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

class CardTahapanbayi extends StatelessWidget {
  final Widget header;
  final String title;
  final String subtitle;
  final String description;
  final List<String> activities;
  final Size size;

  const CardTahapanbayi({
    super.key,
    required this.header,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.activities,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return Container(
      width: sizewidth * 376 / fullwidth,
      padding: EdgeInsets.symmetric(
        horizontal: sizewidth * 16 / fullwidth,
        vertical: sizeheight * 12 / fullheight,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(sizewidth * 20 / fullwidth),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              header,
              SizedBox(width: sizewidth * 8 / fullwidth),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: sizewidth * 18 / fullwidth,
                      fontWeight: FontWeight.w500,
                      color: AppColors.txtPrimary,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: sizewidth * 14 / fullwidth,
                      color: AppColors.txtPrimary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: sizeheight * 10 / fullheight),
          Text(
            description,
            style: TextStyle(
              fontSize: sizewidth * 12 / fullwidth,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: AppColors.txtPrimary,
            ),
          ),
          SizedBox(height: sizeheight * 12 / fullheight),
          Text(
            "Hal yang sering dilakukan",
            style: TextStyle(
              fontSize: sizewidth * 14 / fullwidth,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: AppColors.txtPrimary,
            ),
          ),
          SizedBox(height: sizeheight * 12 / fullheight),
          Wrap(
            spacing: sizewidth * 8 / fullwidth,
            runSpacing: sizeheight * 8 / fullheight,
            children: activities
                .map(
                  (e) => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizewidth * 12 / fullwidth,
                      vertical: sizeheight * 6 / fullheight,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(
                        sizewidth * 20 / fullwidth,
                      ),
                    ),
                    child: Text(
                      e,
                      style: TextStyle(
                        fontSize: sizewidth * 12 / fullwidth,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColors.txtPrimary,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
