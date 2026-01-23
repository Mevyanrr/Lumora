import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/stimulasi/data/models/aktivitas.dart';

class AktivitasCard extends StatefulWidget {
  final Aktivitas data;
  final Size size;

  const AktivitasCard({super.key, required this.data, required this.size});

  @override
  State<AktivitasCard> createState() => _AktivitasCardState();
}

class _AktivitasCardState extends State<AktivitasCard> {
  bool isStarted = false;
  int doneCount = 0;
  bool isCompleted = false;

  double get progress =>
      widget.data.totalCount == 0 ? 0 : doneCount / widget.data.totalCount;

  void onButtonTap() {
    if (isCompleted) return;

    setState(() {
      doneCount++;

      if (doneCount >= widget.data.totalCount) {
        doneCount = widget.data.totalCount;
        isCompleted = true;
      }
    });
  }

  void startProgress() {
    if (isStarted) return;
    setState(() {
      isStarted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizewidth = widget.size.width;
    final sizeheight = widget.size.height;
    final fullheight = 917;
    final fullwidth = 412;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: sizewidth * 16 / fullwidth,
        vertical: sizeheight * 12 / fullheight,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(sizewidth * 15 / fullwidth),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/baby-homepage.png",
                width: sizewidth * 102 / fullwidth,
              ),
              SizedBox(width: sizewidth * 7 / fullwidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: sizewidth * 16 / fullwidth,
                        color: AppColors.txtPrimary,
                      ),
                    ),
                    SizedBox(height: sizeheight * 4 / fullheight),
                    Text(
                      widget.data.description,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: sizewidth * 12 / fullwidth,
                        color: AppColors.txtPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Divider(
            height: sizeheight * 1 / fullwidth,
            color: AppColors.txtPrimary,
          ),

          SizedBox(height: sizeheight * 17 / fullheight),

          Padding(
            padding: EdgeInsets.only(left: sizewidth*20/fullwidth),
            child: Column(
              
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/stimulasi-lamp.svg'),
                    SizedBox(width: sizewidth * 8 / fullwidth),
                    Text(
                      widget.data.fungsi,
                      style: TextStyle(
                        fontSize: sizewidth * 14 / fullwidth,
                        fontWeight: FontWeight.w400,
                        color: AppColors.txtPrimary
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/stimulasi-time.svg'),
                    SizedBox(width: sizewidth * 8 / fullwidth),
                    Text(
                      widget.data.actvtotal,
                      style: TextStyle(
                        fontSize: sizewidth * 14 / fullwidth,
                        fontWeight: FontWeight.w400,
                        color: AppColors.txtPrimary
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: sizeheight * 13 / fullheight),

          Row(
            children: [
              GestureDetector(
                onTap: onButtonTap,
                child: Container(
                  width: sizewidth * 130 / fullwidth,
                  height: sizeheight * 35 / fullheight,
                  decoration: BoxDecoration(
                    color: isCompleted ? AppColors.green : AppColors.txtPrimary,
                    borderRadius: BorderRadius.circular(
                      sizewidth * 50 / fullwidth,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      isCompleted ? "Selesai" : "Dilakukan",
                      style: TextStyle(

                        color: isCompleted? AppColors.txtPrimary : AppColors.white,
                        fontSize: sizewidth * 16 / fullwidth,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: sizewidth * 12 / fullwidth),

              // PROGRESS BAR
              ClipRRect(
                borderRadius: BorderRadius.circular(sizewidth * 50 / fullwidth),
                child: Container(
                  width: sizewidth * 145 / fullwidth,
                  height: sizeheight * 10 / fullheight,
                  color: AppColors.txtSecondary,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: constraints.maxWidth * progress,
                          decoration: BoxDecoration(
                            color: progress >= 1
                                ? AppColors.green
                                : progress >= 0.75
                                ? AppColors.secondary
                                : AppColors.yellowSemantic,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: sizewidth * 6 / fullwidth),
              Text(
                "$doneCount/${widget.data.totalCount}",
                style: TextStyle(
                  fontSize: sizewidth * 16 / fullwidth,
                  fontWeight: FontWeight.w400,
                  color: AppColors.txtPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
