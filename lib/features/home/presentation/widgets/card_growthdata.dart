import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

class GrowthdataCard extends StatelessWidget {
  const GrowthdataCard
  ({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: sizewidth*16/fullwidth, vertical: sizeheight*8/fullheight),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _rowItem(title: "Berat Badan:", value: "8,5 kg"),
          SizedBox(height:sizeheight* 12/fullheight),
          _rowItem(title: "Tinggi Badan:", value: "70 cm"),
          SizedBox(height:sizeheight* 12/fullheight),
          _rowItem(title: "Lingkar Kepala:", value: "45 cm"),
        ],
      ),
    );
  }

  Widget _rowItem({
    
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.txtPrimary
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.txtPrimary
          ),
        ),
        SizedBox(width: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "Normal",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
