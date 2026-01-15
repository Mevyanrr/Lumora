import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lumora/core/theme/colors.dart';

enum GrowthStatus { normal, kurang }

class GrowthdataCard extends StatefulWidget {
  final GrowthStatus beratStatus;
  final GrowthStatus tinggiStatus;
  final GrowthStatus kepalaStatus;

  const GrowthdataCard({
    super.key,
    required this.beratStatus,
    required this.tinggiStatus,
    required this.kepalaStatus,
  });

  @override
  State<GrowthdataCard> createState() => _GrowthdataCardState();
}

class _GrowthdataCardState extends State<GrowthdataCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;

    final worstStatus = _getWorstStatus([
      widget.beratStatus,
      widget.tinggiStatus,
      widget.kepalaStatus,
    ]);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: sizewidth * 16 / fullwidth,
        vertical: sizeheight * 12 / fullheight,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _rowItem(title: "Berat Badan:", value: "8,5 kg", status: widget.beratStatus),
          SizedBox(height: sizeheight * 12 / fullheight),

          _rowItem(
            title: "Tinggi Badan:",
            value: "70 cm",
            status: widget.tinggiStatus,
          ),
          SizedBox(height: sizeheight * 12 / fullheight),

          _rowItem(
            title: "Lingkar Kepala:",
            value: "45 cm",
            status: widget.kepalaStatus,
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
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/home-lamp.svg", width: 24),
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
        ],
      ),
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
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: isNormal ? AppColors.green : AppColors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            isNormal ? "Normal" : "Kurang",
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
