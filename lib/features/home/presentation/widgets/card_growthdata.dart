import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/kuisioner/services/kuisioner_service.dart';

enum GrowthStatus { normal, kurang, lebih }

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

    return StreamBuilder(
      stream: KuisionerService().getKuisionerData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return Text("Data kuisioner tidak tersedia");
        }
        final babyData = snapshot.data!;
        final bulan = DateTime.now().month -
            babyData.tanggalLahir.month +
            (12 * (DateTime.now().year - babyData.tanggalLahir.year));
        final bStatus = _hitungStatus('berat', bulan, babyData.beratBadan);
        final tStatus = _hitungStatus('tinggi', bulan, babyData.tinggiBadan);
        final kStatus = _hitungStatus('kepala', bulan, babyData.lingkarKepala);

        final currentWorstStatus = _getWorstStatus([bStatus, tStatus, kStatus]);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: sizewidth * 376 / fullwidth,
              padding: EdgeInsets.symmetric(
                horizontal: sizewidth * 16 / fullwidth,
                vertical: sizeheight * 12 / fullheight,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryOrange,
                borderRadius: BorderRadius.circular(sizewidth * 16 / fullwidth),
              ),
              child: Column(
                children: [
                  _rowItem(
                    title: "Berat Badan:",
                    value: "${babyData.beratBadan.toStringAsFixed(1)} kg",
                    status: bStatus,
                  ),
                  SizedBox(height: sizeheight * 4 / fullheight),
                  _rowItem(
                    title: "Tinggi Badan:",
                    value: "${babyData.tinggiBadan.toInt()} cm",
                    status: tStatus,
                  ),
                  SizedBox(height: sizeheight * 4 / fullheight),
                  _rowItem(
                    title: "Lingkar Kepala:",
                    value: "${babyData.lingkarKepala.toInt()} cm",
                    status: kStatus,
                  ),
                ],
              ),
            ),

            // BOX INFO - biru jika normal, merah jika kurang
            SizedBox(height: sizeheight * 16 / fullheight),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: sizewidth * 16 / fullwidth,
                vertical: sizeheight * 8 / fullheight,
              ),
              decoration: BoxDecoration(
                color: currentWorstStatus == GrowthStatus.normal
                    ? AppColors.primaryBlue
                    : AppColors.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: sizewidth * 10 / fullwidth),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/home-lamp.svg",
                      width: sizewidth * 16 / fullwidth,
                    ),
                    SizedBox(width: sizewidth * 12 / fullwidth),
                    Expanded(
                      child: Text(
                        currentWorstStatus == GrowthStatus.normal
                            ? "Pertumbuhan bayi sudah sesuai dengan standar pertumbuhan normal."
                            : "Segera bawa ke dokter untuk memeriksa kondisi Si Kecil.",
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
      },
    );
  }

  GrowthStatus _getWorstStatus(List<GrowthStatus> statuses) {
    if (statuses.contains(GrowthStatus.kurang)) return GrowthStatus.kurang;
    if (statuses.contains(GrowthStatus.lebih)) return GrowthStatus.lebih;
    return GrowthStatus.normal;
  }

  Widget _rowItem({
    required String title,
    required String value,
    required GrowthStatus status,
  }) {
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

        //STATUS PER BARIS
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          constraints: const BoxConstraints(minWidth: 56),
          decoration: BoxDecoration(
            color: switch (status) {
              GrowthStatus.normal => AppColors.green,
              GrowthStatus.lebih => AppColors.yellowSemantic,
              GrowthStatus.kurang => AppColors.secondary,
            },
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            switch (status) {
              GrowthStatus.normal => "Normal",
              GrowthStatus.lebih => "Lebih",
              GrowthStatus.kurang => "Kurang",
            },
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

  GrowthStatus _hitungStatus(String kategori, int bulan, double nilai) {
    double min, max;
    switch (kategori) {
      case 'berat':
        (min, max) = switch (bulan) {
          <= 3 => (3.5, 7.5),
          <= 6 => (6.4, 10.0),
          <= 12 => (8.0, 13.5),
          _ => (10.0, 18.0),
        };
      case 'tinggi':
        (min, max) = switch (bulan) {
          <= 3 => (55.0, 65.0),
          <= 6 => (64.0, 73.0),
          <= 12 => (72.0, 83.0),
          _ => (85.0, 97.0),
        };
      case 'kepala':
        (min, max) = switch (bulan) {
          <= 3 => (36.0, 42.0),
          <= 6 => (41.0, 46.0),
          <= 12 => (44.0, 49.0),
          _ => (46.0, 52.0),
        };
      default:
        return GrowthStatus.normal;
    }
    if (nilai < min) return GrowthStatus.kurang;
    if (nilai > max) return GrowthStatus.lebih;
    return GrowthStatus.normal;
  }
}
