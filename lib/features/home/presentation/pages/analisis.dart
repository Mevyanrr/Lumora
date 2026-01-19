import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';
import 'package:lumora/features/home/presentation/bloc/analisis_event.dart';
import 'package:lumora/features/home/presentation/bloc/analisis_state.dart';
import 'package:lumora/features/home/presentation/bloc/analis_bloc.dart';
import 'package:lumora/features/home/presentation/pages/analisisresult_good.dart';

class Analisis extends StatelessWidget {
  const Analisis({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return BlocProvider(
      create: (_) => AnalisisBloc(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.txtPrimary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Analisis Gizi Makanan',
            style: TextStyle(
              fontSize: sizewidth * 22 / fullwidth,
              fontWeight: FontWeight.w600,
              color: AppColors.txtPrimary,
            ),
          ),
        ),
        body: BlocBuilder<AnalisisBloc, AnalisisState>(
          builder: (context, state) {
            if (state is! AnalisisInitial) {
              return SizedBox();
            }

            final data = state.makanan;

            return Padding(
              padding: EdgeInsets.only(
                left: sizewidth * 18 / fullwidth,
                top: sizeheight * 26 / fullheight,
                bottom: sizeheight * 37 / fullheight,
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: sizeheight*30/fullheight) ,
                width: sizewidth * 376 / fullwidth,
                padding: EdgeInsets.symmetric(
                  horizontal: sizewidth * 12 / fullwidth,
                  vertical: sizeheight * 8 / fullheight,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(
                    sizewidth * 16 / fullwidth,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x40000000),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: sizewidth * 12 / fullwidth,
                    vertical: sizeheight * 8 / fullheight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Masukkan menu anda",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: sizewidth * 18 / fullwidth,
                          color: AppColors.txtPrimary,
                        ),
                      ),
                      SizedBox(height: sizeheight * 24 / fullheight),
                      ...List.generate(data.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: sizeheight * 12 / fullheight,
                          ),
                          child: SizedBox(
                            width: sizewidth * 352 / fullwidth,
                            height: sizeheight * 42 / fullheight,
                            child: TextFormField(
                              initialValue: data[index],
                              style: TextStyle(
                                fontSize: sizewidth * 14 / fullwidth,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Masukkan menu',
                                isDense: true,
                                filled: true,
                                fillColor: AppColors.primaryOrange,

                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: sizewidth * 12 / fullwidth,
                                  vertical: sizeheight * 8 / fullheight,
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    sizewidth * 8 / fullwidth,
                                  ),
                                  borderSide: BorderSide(
                                    width: sizewidth * 0.5 / fullwidth,
                                    color: AppColors.txtPrimary,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    sizewidth * 8 / fullwidth,
                                  ),
                                  borderSide: BorderSide(
                                    width: sizewidth * 0.5 / fullwidth,
                                    color: AppColors.txtPrimary,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                context.read<AnalisisBloc>().add(
                                  UpdateMakanan(index, value),
                                );
                              },
                            ),
                          ),
                        );
                      }),

                      GestureDetector(
                        onTap: () {
                          context.read<AnalisisBloc>().add(
                            TambahKolomMakanan(),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.add, size: sizewidth * 24 / fullwidth),
                            Text(
                              'Tambah Kolom',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: sizewidth * 12 / fullwidth,
                                color: AppColors.txtPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height:sizeheight* 27/fullheight),

                     ButtonMedium(
                  text: "Analisis gizi >",
                  width: sizewidth * 327 / fullwidth,
                  height: sizeheight * 45 / fullheight,
                  backgroundColor: AppColors.txtPrimary,
                  borderColor: AppColors.txtPrimary,
                  onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AnalisisresultGood()),
                      );
                  },

                  radius: 15,
                  txColor: AppColors.background,
                ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
