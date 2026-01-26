import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/milestone/data/models/catatan.dart';
import '../../data/models/catatan_item.dart';

class CardNextstep3 extends StatelessWidget {
  final Size size;
  final Catatan data;

  const CardNextstep3({
    super.key,
    required this.size,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final sw= size.width;
    final sh = size.height;
    final fh = 917;
    final fw= 412;

    return Container(
      width: sw * 376 / fw,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(sw*16/fw),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: sw * 18 / fw,
              fontWeight: FontWeight.w600,
              color: AppColors.txtPrimary,
            ),
          ),

          SizedBox(height:sh* 12/fh),

          //List catatan nya
          Column(
            children: data.items.map((item) {
              return Padding(
                padding: EdgeInsets.only(bottom:sw* 9/fw),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildIcon(item.type, size),
                    SizedBox(width:sw* 6/fw),
                    Expanded(
                      child: Text(
                        item.text,
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
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(CatatanType type, size) {
    final sw= size.width;
    final fw= 412;
    switch (type) {
      case CatatanType.warning:
        return SvgPicture.asset(
          'assets/icons/nutriguide-warning.svg',
          width: sw*30/fw,
        );
      case CatatanType.info:
      default:
        return SvgPicture.asset(
          'assets/icons/slim-lamp.svg',
          width: sw*30/fw,
        );
    }
  }
}
