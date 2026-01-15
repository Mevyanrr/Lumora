import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lumora/core/theme/colors.dart';

enum GrowthStatus { normal, kurang }

class GrowthdataCard extends StatelessWidget {
  final GrowthStatus beratStatus;
  final GrowthStatus tinggiStatus;
  final GrowthStatus kepalaStatus;
  final Size size;

  const GrowthdataCard({
    super.key,
    required this.beratStatus,
    required this.tinggiStatus,
    required this.kepalaStatus,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;

    final worstStatus = _getWorstStatus([
      beratStatus,
      tinggiStatus,
      kepalaStatus,
    ]);

    return Column(
      children: [
        Container(
          width: sizewidth*376/fullwidth,
          height: sizeheight*96/fullheight,
          padding: EdgeInsets.symmetric(
            horizontal: sizewidth * 16 / fullwidth,
            vertical: sizeheight * 12 / fullheight,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryOrange,
            borderRadius: BorderRadius.circular(sizewidth* 16/fullwidth),
          ),
          child: Column(
            children: [
              _rowItem(title: "Berat Badan:", value: "8,5 kg", status: beratStatus),
              SizedBox(height: sizeheight * 4 / fullheight),
        
              _rowItem(
                title: "Tinggi Badan:",
                value: "70 cm",
                status: tinggiStatus,
              ),
              SizedBox(height: sizeheight * 4 / fullheight),
        
              _rowItem(
                title: "Lingkar Kepala:",
                value: "45 cm",
                status: kepalaStatus,
              ),
              
            ],
          ),
        ),

        SizedBox(height: sizeheight * 16 / fullheight),
        
              //BOX INFO
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sizewidth * 16 / fullwidth,
                  vertical: sizeheight * 8 / fullheight,
                ),
                decoration: BoxDecoration(
                  color: worstStatus == GrowthStatus.normal
                      ? AppColors.primaryBlue
                      : AppColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: sizewidth*10/fullwidth),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/home-lamp.svg", width: sizewidth*16/fullwidth),
                      SizedBox(width: sizewidth * 12 / fullwidth),
                      Expanded(
                        child: Text(
                          worstStatus == GrowthStatus.normal
                              ? "Pertumbuhan bayi sesuai standar normal."
                              : "Perlu perhatian lebih pada pertumbuhan bayi.",
                          style: TextStyle(
                            fontSize: sizewidth * 12 / fullwidth,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }

  GrowthStatus _getWorstStatus(List<GrowthStatus> statuses) {
    if (statuses.contains(GrowthStatus.kurang)) {
      return GrowthStatus.kurang;
    }
    return GrowthStatus.normal;
  }

  Widget _rowItem({
    required String title,
    required String value,
    required GrowthStatus status,
  }) {
    final isNormal = status == GrowthStatus.normal;

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.txtPrimary,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.txtPrimary,
          ),
        ),
        SizedBox(width: 8),

        //STATUS NYA PER BARIS
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: isNormal ? AppColors.green : AppColors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            isNormal ? "Normal" : "Kurang",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.txtPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
