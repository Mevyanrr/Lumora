import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/navbar.dart';
import 'package:lumora/features/kuisioner/services/kuisioner_service.dart';
import 'package:lumora/features/milestone/presentation/bloc/milestone_bloc.dart';
import 'package:lumora/features/milestone/presentation/bloc/milestone_event.dart';
import 'package:lumora/features/milestone/presentation/bloc/month_bloc.dart';
import 'package:lumora/features/milestone/presentation/bloc/month_event.dart';
import 'package:lumora/features/milestone/presentation/bloc/month_state.dart';
import 'package:lumora/features/milestone/presentation/cubit/pencapaian_cubit.dart';
import 'package:lumora/features/milestone/presentation/widgets/calendar.dart';
import 'package:lumora/features/milestone/presentation/widgets/card_aktivitas.dart';
import 'package:lumora/features/milestone/presentation/widgets/card_pencapaian.dart';
import 'package:lumora/features/milestone/presentation/widgets/monthlygoal.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_bloc.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_event.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_state.dart';
import 'package:lumora/features/stimulasi/presentation/widgets/aktivitas_card.dart';

class Milestone extends StatefulWidget {
  const Milestone({super.key});

  @override
  State<Milestone> createState() => _MilestoneState();
}

class _MilestoneState extends State<Milestone> with TickerProviderStateMixin {
  final ScrollController _ageScrollController = ScrollController();
  final ScrollController _dayScrollController = ScrollController();
  late final TabController _tabController;
  bool _dayScrolled = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
    context.read<AktivitasBloc>().add(LoadAktivitas());
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging && _tabController.index == 1 && !_dayScrolled) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToToday());
    }
  }

  void _scrollToToday({int retries = 5}) {
    if (_dayScrolled) return;
    if (!_dayScrollController.hasClients) {
      if (retries > 0) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => _scrollToToday(retries: retries - 1),
        );
      }
      return;
    }
    _dayScrolled = true;
    final now = DateTime.now();
    final today = now.day;
    final daysInMonth = DateUtils.getDaysInMonth(now.year, now.month);
    final pos = _dayScrollController.position;
    final totalWidth = pos.maxScrollExtent + pos.viewportDimension;
    final itemWidth = totalWidth / daysInMonth;
    final centeredOffset = (today - 1) * itemWidth - pos.viewportDimension / 2 + itemWidth / 2;
    _dayScrollController.animateTo(
      centeredOffset.clamp(0, pos.maxScrollExtent),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
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

    return StreamBuilder(
      stream: KuisionerService().getKuisionerData(),
      builder: (context, babySnapshot) {
        // Hitung usia bayi dalam bulan, sama seperti di home_page.dart
        int babyAgeMonths = 0;
        if (babySnapshot.hasData && babySnapshot.data != null) {
          final babyData = babySnapshot.data!;
          final now = DateTime.now();
          babyAgeMonths = now.month -
              babyData.tanggalLahir.month +
              (12 * (now.year - babyData.tanggalLahir.year));
          final hari = now.day - babyData.tanggalLahir.day;
          if (hari < 0) babyAgeMonths--;
          if (babyAgeMonths < 0) babyAgeMonths = 0;
        }

        // Trigger MonthBloc setiap kali usia berubah
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<MonthBloc>().add(LoadMonth(babyAgeMonths));
        });

        return Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Navbar(selectedItem: 2),
          body: Container(
            decoration: BoxDecoration(color: AppColors.background),
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverToBoxAdapter(
                      child: SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: sh * 20 / fh, bottom: sh * 30 / fh),
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
                                    BlocBuilder<AktivitasBloc, AktivitasState>(
                                      builder: (context, aktivitasState) {
                                        int totalTask = 1;
                                        int completedTask = 0;
                                        int totalAktivitas = 0;
                                        int streaks = 0;

                                        if (aktivitasState is AktivitasLoaded) {
                                          totalTask = aktivitasState
                                                  .bulanIni.isEmpty
                                              ? 1
                                              : aktivitasState.bulanIni.length;
                                          completedTask = aktivitasState
                                              .bulanIni
                                              .where((a) => a.isCompleted)
                                              .length;

                                          totalAktivitas = [
                                            ...aktivitasState.bulanLalu,
                                            ...aktivitasState.bulanIni
                                          ].fold(
                                              0,
                                              (sum, item) =>
                                                  sum + item.doneCount);
                                          streaks = aktivitasState.streakCount;
                                        }

                                        return BlocBuilder<MonthBloc,
                                            MonthState>(
                                          builder: (context, monthState) {
                                            int bulan = babyAgeMonths;
                                            if (monthState is MonthLoaded) {
                                              bulan = monthState.currentMonth;
                                            }

                                            return Column(
                                              children: [
                                                MonthlyGoal(
                                                  size: size,
                                                  totalTask: totalTask,
                                                  completedTask: completedTask,
                                                ),
                                                SizedBox(height: sh * 32 / fh),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CardAktivitas(
                                                      size: size,
                                                      count: bulan,
                                                      title: "Bulan",
                                                      icon:
                                                          "assets/icons/growbaby-feet.svg",
                                                    ),
                                                    CardAktivitas(
                                                      size: size,
                                                      count: totalAktivitas,
                                                      title: "Aktivitas",
                                                      icon:
                                                          "assets/icons/stopwatch.svg",
                                                    ),
                                                    CardAktivitas(
                                                      size: size,
                                                      count: streaks,
                                                      title: "Streaks",
                                                      icon:
                                                          "assets/icons/fire.svg",
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
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
                                          controller: _tabController,
                                          backgroundColor:
                                              AppColors.yellowSemantic,
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView(
                      padding: EdgeInsets.only(
                          left: sw * 18 / fw, bottom: sh * 101 / fh),
                      children: [
                        //TAHAPAN BULAN NYA BAYI
                        BlocBuilder<MonthBloc, MonthState>(
                          builder: (context, state) {
                            if (state is MonthLoaded) {
                              final currentIndex = state.ages.indexWhere(
                                (range) =>
                                    getAgeStatus(range, state.currentMonth) ==
                                    AgeStatus.current,
                              );

                              //buat scroll current nya
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
                                height: size.height * 70 / 917,
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
                        ),
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
                        SizedBox(
                          height: sw * 21 / fw,
                        ),

                        Padding(
                          padding: EdgeInsets.only(right: sw * 18 / fw),
                          child: BlocBuilder<AktivitasBloc, AktivitasState>(
                            builder: (context, aktivitasState) {
                              if (aktivitasState is AktivitasLoaded) {
                                final aktivitasList = aktivitasState.bulanIni;
                                if (aktivitasList.isEmpty) {
                                  return Center(
                                    child: Text(
                                      'Belum ada aktivitas untuk usia ini.',
                                      style: TextStyle(
                                        color: AppColors.txtSecondary,
                                        fontSize: sw * 14 / fw,
                                      ),
                                    ),
                                  );
                                }
                                return ListView.separated(
                                  padding:
                                      EdgeInsets.only(bottom: sh * 20 / fh),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: aktivitasList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: sh * 12 / fh),
                                  itemBuilder: (context, index) {
                                    final aktivitas = aktivitasList[index];
                                    return BlocProvider(
                                      create: (_) => PencapaianCubit(aktivitas),
                                      child: CardPencapaian(
                                        size: size,
                                        aktivitas: aktivitas,
                                      ),
                                    );
                                  },
                                );
                              }
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          ),
                        ),
                      ],
                    ),

                    //TUMBUH KEMBANG DATE
                    ListView(
                        padding: EdgeInsets.only(left: sw * 18 / fw),
                        children: [
                          SizedBox(
                            height: size.height * 70 / 917,
                            child: BlocBuilder<MonthBloc, MonthState>(
                              builder: (context, state) {
                                return ListView.builder(
                                  controller: _dayScrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: daysInMonth,
                                  itemBuilder: (context, index) {
                                    final date = index + 1;
                                    final dateTime =
                                        DateTime(now.year, now.month, date);
                                    final dayName =
                                        dayNames[dateTime.weekday % 7];

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
                              },
                            ),
                          ),
                          SizedBox(height: sh * 21 / fh),
                          Padding(
                            padding: EdgeInsets.only(right: sw * 18 / fw),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Aktivitas yang dilakukan",
                                  style: TextStyle(
                                    fontSize: sw * 18 / fw,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.txtPrimary,
                                  ),
                                ),
                                SizedBox(height: sh * 16 / fh),
                                BlocBuilder<AktivitasBloc, AktivitasState>(
                                  builder: (context, state) {
                                    if (state is AktivitasLoading) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else if (state is AktivitasLoaded) {
                                      final doneActivities = [
                                        ...state.bulanLalu,
                                        ...state.bulanIni,
                                      ].where((a) => a.doneCount > 0).toList();

                                      if (doneActivities.isEmpty) {
                                        return Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: sh * 20 / fh),
                                            child: Text(
                                              "Belum ada aktivitas yang dilakukan",
                                              style: TextStyle(
                                                color: AppColors.txtSecondary,
                                                fontSize: sw * 14 / fw,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      return ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.only(
                                            bottom: sh * 101 / fh),
                                        itemCount: doneActivities.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: sh * 16 / fh),
                                        itemBuilder: (context, index) {
                                          return AktivitasCard(
                                            data: doneActivities[index],
                                            size: size,
                                          );
                                        },
                                      );
                                    }
                                    return const SizedBox();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ])
                  ],
                ),
              ),
            ),
        );
      },
    );
  }
}

