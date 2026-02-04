import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/stimulasi/data/models/aktivitas.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_bloc.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_event.dart';

class AktivitasCard extends StatelessWidget {
  final Aktivitas data;
  final Size size;

  const AktivitasCard({super.key, required this.data, required this.size});

  @override
  Widget build(BuildContext context) {
    // Variable Helper untuk Responsif
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;

    // Hitung Progress (0.0 sampai 1.0)
    final double progress = data.totalCount == 0 ? 0 : data.doneCount / data.totalCount;
    final bool isCompleted = data.isCompleted;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: sizewidth * 16 / fullwidth,
        vertical: sizeheight * 12 / fullheight,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange, // Pastikan warna ini ada di theme kamu
        borderRadius: BorderRadius.circular(sizewidth * 15 / fullwidth),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- HEADER: IMAGE & TITLE ---
          Row(
            children: [
              Image.asset(
                "assets/images/baby-homepage.png",
                width: sizewidth * 60 / fullwidth, // Sesuaikan ukuran
                fit: BoxFit.cover,
              ),
              SizedBox(width: sizewidth * 12 / fullwidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: sizewidth * 16 / fullwidth,
                        color: AppColors.txtPrimary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      data.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: sizewidth * 12 / fullwidth,
                        color: AppColors.txtPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          SizedBox(height: 12),
          Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),
          SizedBox(height: 12),

          // --- INFO FUNGSI & WAKTU ---
          _buildInfoRow(
            "assets/icons/stimulasi-lamp.svg", // Pastikan aset ada
            data.fungsi, 
            sizewidth, fullwidth.toDouble()
          ),
          SizedBox(height: 8),
          _buildInfoRow(
            "assets/icons/stimulasi-time.svg", 
            data.actvtotal, 
            sizewidth, fullwidth.toDouble()
          ),

          SizedBox(height: sizeheight * 16 / fullheight),

          // --- TOMBOL & PROGRESS BAR ---
          Row(
            children: [
              // TOMBOL DILAKUKAN
              GestureDetector(
                onTap: () {
                  // Logic: Kalau belum selesai, kirim event ke Bloc
                  if (!isCompleted) {
                    context.read<AktivitasBloc>().add(ActivityStatus(data));
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: isCompleted ? AppColors.green : AppColors.txtPrimary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      isCompleted ? "Selesai" : "Dilakukan",
                      style: TextStyle(
                        color: isCompleted ? AppColors.txtPrimary : Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: sizewidth * 14 / fullwidth,
                      ),
                    ),
                  ),
                ),
              ),
              
              SizedBox(width: sizewidth * 12 / fullwidth),

              // PROGRESS BAR
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 10,
                    color: AppColors.txtSecondary, // Warna background bar
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: constraints.maxWidth * progress,
                            color: progress >= 1 
                                ? AppColors.green 
                                : AppColors.yellowSemantic,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              
              SizedBox(width: 8),
              
              // ANGKA (Contoh: 1/4)
              Text(
                "${data.doneCount}/${data.totalCount}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.txtPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String iconPath, String text, double sw, double fw) {
    return Row(
      children: [
        SvgPicture.asset(iconPath, width: 16),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: sw * 13 / fw,
              color: AppColors.txtPrimary,
            ),
          ),
        ),
      ],
    );
  }
}