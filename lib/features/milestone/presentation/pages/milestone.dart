import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/navbar.dart';
import 'package:lumora/features/milestone/presentation/bloc/milestone_bloc.dart';
import 'package:lumora/features/milestone/presentation/bloc/milestone_event.dart';
import 'package:lumora/features/milestone/presentation/bloc/month_bloc.dart';
import 'package:lumora/features/milestone/presentation/bloc/month_event.dart';
import 'package:lumora/features/milestone/presentation/bloc/month_state.dart';
import 'package:lumora/features/milestone/presentation/widgets/calendar.dart';
import 'package:lumora/features/milestone/presentation/widgets/card_aktivitas.dart';
import 'package:lumora/features/milestone/presentation/widgets/monthlygoal.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:lumora/features/stimulasi/presentation/widgets/aktivitas_card.dart';

class Milestone extends StatefulWidget {
  const Milestone({super.key});

  @override
  State<Milestone> createState() => _MilestoneState();
}

class _MilestoneState extends State<Milestone> {
  final ScrollController _ageScrollController = ScrollController();
  final ScrollController _dayScrollController = ScrollController();

  @override
  void dispose() {
    _ageScrollController.dispose();
    _dayScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sw = size.width;
    final sh = size.height;
    final fh = 917;
    final fw = 412;
    final now = DateTime.now();
    final daysInMonth = DateUtils.getDaysInMonth(now.year, now.month);
    final today = now.day;

    const dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: SafeArea(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Milestone",
                          style: TextStyle(
                            fontSize: sw * 22 / fw,
                            fontWeight: FontWeight.w600,
                            color: AppColors.txtPrimary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: sw * 18 / fw,
                            right: sw * 18 / fw,
                            top: sh * 32 / fh),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Monthly Goal",
                              style: TextStyle(
                                fontSize: sw * 18 / fw,
                                fontWeight: FontWeight.w500,
                                color: AppColors.txtPrimary,
                              ),
                            ),
                            SizedBox(height: sh * 8 / fh),
                            BlocProvider(
                              create: (_) => MilestoneBloc()
                                ..add(LoadMilestone(
                                  totalTask: 12,
                                  completedTask: 7,
                                )),
                              child: MonthlyGoal(size: size),
                            ),
                            SizedBox(height: sh * 32 / fh),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CardAktivitas(
                                  size: size,
                                  count: 8,
                                  title: "Bulan",
                                  icon: "assets/icons/growbaby-feet.svg",
                                ),
                                CardAktivitas(
                                  size: size,
                                  count: 120,
                                  title: "Aktivitas",
                                  icon: "assets/icons/stopwatch.svg",
                                ),
                                CardAktivitas(
                                  size: size,
                                  count: 40,
                                  title: "Streaks",
                                  icon: "assets/icons/fire.svg",
                                ),
                              ],
                            ),
                            SizedBox(height: sh * 32 / fh),
                            Container(
                              width: sw * 376 / fw,
                              padding: EdgeInsets.symmetric(
                                  //     horizontal: sw * 8 / fw,
                                  vertical: sh * 8 / fh),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(63),
                                color: AppColors.primaryOrange,
                              ),
                              child: Center(
                                child: ButtonsTabBar(
                                  backgroundColor: AppColors.yellowSemantic,
                                  unselectedBackgroundColor:
                                      AppColors.background,
                                  labelStyle: TextStyle(
                                    color: AppColors.txtPrimary,
                                    fontSize: sw * 16 / fw,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  unselectedLabelStyle: TextStyle(
                                    color: AppColors.txtSecondary,
                                    fontSize: sw * 16 / fw,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  borderWidth: 1,
                                  borderColor: AppColors.yellowSemantic,
                                  radius: sw * 28 / fw,
                                  height: sh * 48 / fh,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: sw * 24 / fw,
                                    vertical: sh * 8 / fh,
                                  ),
                                  tabs: [
                                    Tab(text: "Aktivitas Selesai"),
                                    Tab(text: "Tumbuh Kembang"),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: sh * 32 / fh),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView(
                padding: EdgeInsets.only(left: sw * 18 / fw),
                children: [
                  BlocProvider(
                      create: (_) => MonthBloc()..add(LoadMonth(17)),
                      child: BlocBuilder<MonthBloc, MonthState>(
                        builder: (context, state) {
                          if (state is MonthLoaded) {
                            final currentIndex = state.ages.indexWhere(
                              (range) =>
                                  getAgeStatus(range, state.currentMonth) ==
                                  AgeStatus.current,
                            );

                            //buat scroll curr nya
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (currentIndex != -1 &&
                                  _ageScrollController.hasClients) {
                                const itemWidth = 80.0;
                                _ageScrollController.animateTo(
                                  currentIndex * itemWidth,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeOut,
                                );
                              }
                            });

                            return SizedBox(
                              height: size.height * 67 / 917,
                              child: ListView.builder(
                                controller: _ageScrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.ages.length,
                                itemBuilder: (context, index) {
                                  final range = state.ages[index];
                                  final status =
                                      getAgeStatus(range, state.currentMonth);

                                  return CalendarItem(
                                    size: size,
                                    topText: range.label,
                                    bottomText: "Bulan",
                                    status: status,
                                  );
                                },
                              ),
                            );
                          }

                          return const SizedBox();
                        },
                      )),
                  SizedBox(height: sh * 21 / fh),
                  Padding(
                    padding: EdgeInsets.only(right: sw * 18 / fw),
                    child: Text(
                      "Pencapaian",
                      style: TextStyle(
                        fontSize: sw * 18 / fw,
                        fontWeight: FontWeight.w500,
                        color: AppColors.txtPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: sh * 3 / fh),
                  Text(
                    "Pada usia ini Si Kecil seharusnya sudah bisa melakukan beberapa hal di bawah berikut.",
                    style: TextStyle(
                      fontSize: sw * 14 / fw,
                      fontWeight: FontWeight.w400,
                      color: AppColors.txtPrimary,
                    ),
                  ),
                  Image.asset("assets/images/logo.png"),
                  Image.asset("assets/images/logo.png"),
                ],
              ),
              ListView(padding: EdgeInsets.only(left: sw * 18 / fw), children: [
                SizedBox(
                  height: size.height * 67 / 917,
                  child: Builder(builder: (context) {
                    final currentDayIndex = today - 1;

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (_dayScrollController.hasClients) {
                        const itemWidth = 80.0; 
                        _dayScrollController.animateTo(
                          currentDayIndex * itemWidth,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                        );
                      }
                    });

                    return ListView.builder(
                      controller: _dayScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: daysInMonth,
                      itemBuilder: (context, index) {
                        final date = index + 1;
                        final dateTime = DateTime(now.year, now.month, date);
                        final dayName = dayNames[dateTime.weekday % 7];

                        final status = date == today
                            ? AgeStatus.current
                            : date < today
                                ? AgeStatus.past
                                : AgeStatus.future;

                        return CalendarItem(
                          size: size,
                          topText: date.toString(),
                          bottomText: dayName,
                          status: status,
                        );
                      },
                    );
                  }),
                ),
                SizedBox(height: sh * 21 / fh),
                Padding(
                  padding: EdgeInsets.only(right: sw * 18 / fw),
                  child: Column(
                    children: [
                      Text(
                        "Aktivitas yang dilakukan",
                        style: TextStyle(
                          fontSize: sw * 18 / fw,
                          fontWeight: FontWeight.w500,
                          color: AppColors.txtPrimary,
                        ),
                      ),
                      //TARUH CARD AKTIVITAS YG UDH SELESAI
                    ],
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(selectedItem: 2),
    );
  }
}
