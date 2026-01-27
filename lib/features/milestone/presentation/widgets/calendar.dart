import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/milestone/data/models/month_range.dart';

enum CalendarMode {
  age,   
  day,   
}

enum AgeStatus { past, current, future }

AgeStatus getAgeStatus(MonthRange range, int currentMonth) {
  if (currentMonth < range.start) return AgeStatus.future;
  if (currentMonth > range.end) return AgeStatus.past;
  return AgeStatus.current;
}


class CalendarItem extends StatelessWidget {
  final Size size;
  final String topText;     
  final String bottomText;   
  final AgeStatus status;

  const CalendarItem({
    super.key,
    required this.size,
    required this.topText,
    required this.bottomText,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final sw = size.width;
    final sh = size.height;
    final fh = 917;
    final fw = 412;

    Color bgColor;
    Color textColor;

    switch (status) {
      case AgeStatus.current:
        bgColor = AppColors.yellowSemantic;
        textColor = AppColors.txtPrimary;
        break;
      case AgeStatus.past:
        bgColor = AppColors.background;
        textColor = AppColors.txtPrimary;
        break;
      case AgeStatus.future:
        bgColor = AppColors.background;
        textColor = AppColors.txtSecondary;
        break;
    }

    return Container(
      margin: EdgeInsets.only(right: sw * 12 / fw),
      padding: EdgeInsets.all(sw * 10 / fw),
      height: sh * 70 / fh,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(sw * 21 / fw),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topText,
            style: TextStyle(
              fontSize: sw * 18 / fw,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          Text(
            bottomText,
            style: TextStyle(
              fontSize: sw * 14 / fw,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}


