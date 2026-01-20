import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/home/data/models/panduan_item.dart';

class PanduanInfoCard extends StatelessWidget {
  final List<PanduanItem> items;
  final Size size;

  const PanduanInfoCard({super.key, required this.items, required this.size});

  Widget _getIcon(PanduanIconType type, double size) {
    switch (type) {
      case PanduanIconType.warning:
        return SvgPicture.asset(
          "assets/icons/nutriguide-warning.svg",
          width: size,
          height: size,
        );
      case PanduanIconType.checklist:
      default:
        return SvgPicture.asset(
          "assets/icons/nutriguide-checklist.svg",
          width: size,
          height: size,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return Container(
      width: sizewidth * 376 / fullwidth,
      padding: EdgeInsets.symmetric(
        horizontal: sizewidth * 12 / fullwidth,
        vertical: sizeheight * 8 / fullheight,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(sizewidth * 16 / fullwidth),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: sizeheight * 8 / fullheight,
              horizontal: sizewidth * 10 / fullwidth,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _getIcon(item.iconType, sizewidth * 24 / fullwidth),
                SizedBox(width: sizewidth * 8 / fullwidth),
                Expanded(
                  child: Text(
                    item.text,
                    style: TextStyle(
                      fontSize: sizewidth * 14 / fullwidth,
                      fontWeight: FontWeight.w400,
                      color: AppColors.txtPrimary,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
