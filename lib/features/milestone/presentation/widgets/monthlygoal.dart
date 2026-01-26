import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/milestone/presentation/bloc/milestone_bloc.dart';
import 'package:lumora/features/milestone/presentation/bloc/milestone_state.dart';

class MonthlyGoal extends StatelessWidget {
  final Size size;

  const MonthlyGoal({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final sw = size.width;
    final sh = size.height;
    final fh = 917;
    final fw = 412;
    return BlocBuilder<MilestoneBloc, MilestoneState>(
      builder: (context, state) {
        if (state is! MilestoneLoaded) {
          return const SizedBox();
        }

        final double progress = state.progress.clamp(0.0, 1.0);
        final int percentage = (progress * 100).round();

        return Container(
          width: sw * 376 / fw,
          height: sh * 129 / fh,
          padding: EdgeInsets.symmetric(
              horizontal: sw * 16 / fw, vertical: sh * 12 / fh),
          decoration: BoxDecoration(
            color: AppColors.primaryOrange,
            borderRadius: BorderRadius.circular(sw * 15 / fw),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //top
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${state.completedTask}/${state.totalTask} task',
                    style: TextStyle(
                        fontSize: sw * 16 / fw,
                        fontWeight: FontWeight.w400,
                        color: AppColors.txtPrimary),
                  ),
                  Text(
                    '$percentage%',
                    style: TextStyle(
                        fontSize: sw * 16 / fw,
                        fontWeight: FontWeight.w400,
                        color: AppColors.txtPrimary),
                  ),
                ],
              ),

              SizedBox(height: sh * 25 / fh),

              Row(
                children: List.generate(4, (index) {
                  const totalSegments = 4;
                  final segmentValue = 1 / totalSegments;

                  final start = index * segmentValue;
                  final end = start + segmentValue;

                  double fill;
                  if (progress >= end) {
                    fill = 1;
                  } else if (progress <= start) {
                    fill = 0;
                  } else {
                    fill = (progress - start) / segmentValue;
                  }

                  return Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: index == 0 ? 0 : sw * 8 / fw),
                      child: SizedBox(
                        height: sh * 9 / fh,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(sw * 12 / fw),
                          child: Stack(
                            children: [
                              //bg bar
                              Container(
                                color: AppColors.txtSecondary,
                              ),

                              //bg actv bar
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                    width: constraints.maxWidth * fill,
                                    decoration: BoxDecoration(
                                      color: AppColors.yellowSemantic,
                                      borderRadius:
                                          BorderRadius.circular(sw * 12 / fw),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height:sh* 25/fh),

              Text(
                'Kerja Bagus! Tetaplah konsisten.',
                style: TextStyle(
                        fontSize: sw * 14 / fw,
                        fontWeight: FontWeight.w400,
                        color: AppColors.txtPrimary),
              ),
            ],
          ),
        );
      },
    );
  }
}
