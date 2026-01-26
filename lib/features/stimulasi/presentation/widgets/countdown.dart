import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import '../bloc/countdown_bloc.dart';
import '../bloc/countdown_state.dart';

class CountdownContainer extends StatelessWidget {
  final Size size;
  const CountdownContainer({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;

    return BlocBuilder<CountdownBloc, CountdownState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: sizewidth * 16 / fullwidth,
            vertical: sizeheight * 12 / fullheight,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryOrange,
            borderRadius: BorderRadius.circular(sizewidth * 10 / fullwidth),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selesaikan sebelum:",
                      style: TextStyle(
                        fontSize: sizewidth * 14 / fullwidth,
                        fontWeight: FontWeight.w400,
                        color: AppColors.txtPrimary,
                      ),
                    ),
                    SizedBox(height: sizeheight * 6 / fullheight),
                    Text(
                      _formatDate(state.targetDate),
                      style: TextStyle(
                        fontSize: sizewidth * 16 / fullwidth,
                        fontWeight: FontWeight.w600,
                        color: AppColors.txtPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  _timeBox(state.days, "Hari"),
                  _dot(),
                  _timeBox(state.hours, "Jam"),
                  _dot(),
                  _timeBox(state.minutes, "Menit"),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _timeBox(int value, String label) {
    final sizewidth = size.width;
    final fullwidth = 412;
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: sizewidth * 16 / fullwidth,
            fontWeight: FontWeight.w400,
            color: AppColors.txtPrimary,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.txtPrimary,
          ),
        ),
      ],
    );
  }

  Widget _dot() {
    final sizewidth = size.width;
    final fullwidth = 412;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizewidth * 8 / fullwidth),
      child: Text(":", style: TextStyle(fontSize: sizewidth * 20 / fullwidth)),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember",
    ];

    return "${date.day} ${months[date.month - 1]} ${date.year}";
  }
}
