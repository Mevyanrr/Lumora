import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/kuisioner/services/kuisioner_service.dart';

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
        StreamBuilder(stream: KuisionerService().getKuisionerData(), builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          if(!snapshot.hasData || snapshot.data == null){
            return Text("Data kuisioner tidak tersedia");
          }
          final babyData = snapshot.data;
          final bulan = DateTime.now().month - babyData!.tanggalLahir.month + (12 + (DateTime.now().year - babyData.tanggalLahir.year));
          final bStatus = _hitungStatus('berat', bulan, babyData.beratBadan);
          final tStatus = _hitungStatus('tinggi', bulan, babyData.tinggiBadan);
          final kStatus = _hitungStatus('kepala', bulan, babyData.lingkarKepala);

        final currentWorstStatus = _getWorstStatus([bStatus, tStatus, kStatus]);
        return
        
        Container(
          width: sizewidth*376/fullwidth,
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
              _rowItem(title: "Berat Badan:", value: "${babyData?.beratBadan.toStringAsFixed(1)} kg", status: bStatus),
              SizedBox(height: sizeheight * 4 / fullheight),
        
              _rowItem(
                title: "Tinggi Badan:",
                value: "${(babyData?.tinggiBadan.toInt()).toString()} cm",
                status: tStatus,
              ),
              SizedBox(height: sizeheight * 4 / fullheight),
        
              _rowItem(
                title: "Lingkar Kepala:",
                value: "${(babyData?.lingkarKepala.toInt()).toString()} cm",
                status: kStatus,
              ),
              
            ],
          ),
        );
        }),

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
        )
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

  GrowthStatus _hitungStatus(String kategori, int bulan, double nilai){
    return switch(kategori){
      'berat' => switch (bulan) {
        <= 3 => nilai >= 3.5 ? GrowthStatus.normal : GrowthStatus.kurang,
        <= 6 => nilai >= 6.4 ? GrowthStatus.normal : GrowthStatus.kurang,
        <= 12 => nilai >= 8.0 ? GrowthStatus.normal : GrowthStatus.kurang,
        _ => nilai >= 10.0 ? GrowthStatus.normal : GrowthStatus.kurang,
      },
    'tinggi' => switch (bulan) {
        <= 3 => nilai >= 55.0 ? GrowthStatus.normal : GrowthStatus.kurang,
        <= 6 => nilai >= 64.0 ? GrowthStatus.normal : GrowthStatus.kurang,
        <= 12 => nilai >= 72.0 ? GrowthStatus.normal : GrowthStatus.kurang,
        _ => nilai >= 85.0 ? GrowthStatus.normal : GrowthStatus.kurang,
      },
    _ => GrowthStatus.normal,
    };
  }
  
}
