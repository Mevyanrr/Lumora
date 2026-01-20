import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

class ContainerBadresult extends StatelessWidget {
  final Size size;
  final String text;

  const ContainerBadresult({
    super.key,
    required this.size,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final fullwidth = 412;
    final sizeheight = size.height;
    final fullheight = 917;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sizewidth*8/fullwidth, vertical: sizeheight*4/fullheight),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(
          sizewidth * 15 / fullwidth,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, 
        children: [
          Icon(
            Icons.add,
            size: sizewidth * 20 / fullwidth,
            color: AppColors.txtPrimary,
          ),
          SizedBox(width: sizewidth* 2/fullwidth),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: sizewidth * 12 / fullwidth,
              color: AppColors.txtPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
