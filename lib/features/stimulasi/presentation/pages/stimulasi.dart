import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/navbar.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_bloc.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_event.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_state.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/countdown_bloc.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/countdown_event.dart';
import 'package:lumora/features/stimulasi/presentation/widgets/aktivitas_card.dart';
import 'package:lumora/features/stimulasi/presentation/widgets/countdown.dart';

class Stimulasi extends StatefulWidget {
  const Stimulasi({super.key});

  @override
  State<Stimulasi> createState() => _StimulasiState();
}

class _StimulasiState extends State<Stimulasi> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return BlocProvider(
      create: (_) => AktivitasBloc()..add(LoadAktivitas()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: sizewidth * 18 / fullwidth,
                right: sizewidth * 18 / fullwidth,
                top: sizeheight * 19 / fullheight,
                bottom: sizeheight * 15 / fullheight,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Stimulasi Aktivitas",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: sizewidth * 22 / fullwidth,
                      fontWeight: FontWeight.w600,
                      color: AppColors.txtPrimary,
                    ),
                  ),
                  SizedBox(height: sizeheight * 5 / fullheight),
                  Text(
                    "Rekomendasi aktivitas untuk melatih sensorik dan motorik sederhana untuk Si Kecil.",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: sizewidth * 14 / fullwidth,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: sizeheight * 11 / fullheight),

                  BlocProvider(
                    create: (_) => CountdownBloc()
                      ..add(
                        StartCountdown(
                          DateTime(2026, 1, 31), 
                        ),
                      ),
                    child: CountdownContainer(size: size,),
                  ),

                  SizedBox(height: sizeheight * 32 / fullheight),

                  BlocBuilder<AktivitasBloc, AktivitasState>(
                    builder: (context, state) {
                      if (state is AktivitasLoaded) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (state.bulanLalu.isNotEmpty) ...[
                              Text(
                                "Belum Selesai Bulan Lalu",
                                style: TextStyle(
                                  fontSize: sizewidth * 18 / fullwidth,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.txtPrimary,
                                ),
                              ),
                              SizedBox(height: sizeheight * 16 / fullheight),

                              ...List.generate(
                                state.bulanLalu.length,
                                (index) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: sizeheight * 12 / fullheight,
                                  ),
                                  child: AktivitasCard(
                                    size: size,
                                    data: state.bulanLalu[index],
                                  ),
                                ),
                              ),

                              // SizedBox(height: sizeheight * 16 / fullheight),
                            ],

                            //BULAN INI
                            SizedBox(height: sizeheight * 32 / fullheight),
                            Text(
                              "Aktivitas Bulan Ini",
                              style: TextStyle(
                                fontSize: sizewidth * 18 / fullwidth,
                                fontWeight: FontWeight.w500,
                                color: AppColors.txtPrimary,
                              ),
                            ),
                            SizedBox(height: sizeheight * 16 / fullheight),

                            ...List.generate(
                              state.bulanIni.length,
                              (index) => Padding(
                                padding: EdgeInsets.only(
                                  bottom: sizeheight * 12 / fullheight,
                                ),
                                child: AktivitasCard(
                                  size: size,
                                  data: state.bulanIni[index],
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Navbar(selectedItem: 1),
      ),
    );
  }
}
