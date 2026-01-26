import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/milestone/presentation/bloc/milestone_bloc.dart';
import 'package:lumora/features/milestone/presentation/bloc/milestone_event.dart';
import 'package:lumora/features/milestone/presentation/widgets/card_aktivitas.dart';
import 'package:lumora/features/milestone/presentation/widgets/monthlygoal.dart';

class Milestone extends StatelessWidget {
  const Milestone({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sw = size.width;
    final sh = size.height;
    final fh = 917;
    final fw = 412;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Milestone",
            style: TextStyle(
                fontSize: sw * 22 / fw,
                fontWeight: FontWeight.w600,
                color: AppColors.txtPrimary),
          ),
        ),
        backgroundColor: AppColors.background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sw * 18 / fw, vertical: sh * 32 / fh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Monthly Goal",
                  style: TextStyle(
                      fontSize: sw * 18 / fw,
                      fontWeight: FontWeight.w500,
                      color: AppColors.txtPrimary)),
              SizedBox(
                height: sh * 8 / fh,
              ),
              BlocProvider(
                create: (_) => MilestoneBloc()
                  ..add(
                    LoadMilestone(
                      totalTask: 12,
                      completedTask: 7,
                    ),
                  ),
                child: MonthlyGoal(size: size)
              ),
              SizedBox(
                height: sh * 32 / fh,
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardAktivitas(size: size, count: 8, title: "Bulan", icon: "assets/icons/growbaby-feet.svg",),
                  CardAktivitas(size: size, count: 120, title: "Aktivitas", icon: "assets/icons/stopwatch.svg",),
                  CardAktivitas(size: size, count: 40, title: "Streaks", icon: "assets/icons/fire.svg"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
