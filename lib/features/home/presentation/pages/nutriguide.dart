import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/home/presentation/bloc/panduaninfo_bloc.dart';
import 'package:lumora/features/home/presentation/bloc/panduaninfo_event.dart';
import 'package:lumora/features/home/presentation/bloc/panduaninfo_state.dart';
import 'package:lumora/features/home/presentation/bloc/tipsgizi_bloc.dart';
import 'package:lumora/features/home/presentation/bloc/tipsgizi_event.dart';
import 'package:lumora/features/home/presentation/bloc/tipsgizi_state.dart';
import 'package:lumora/features/home/presentation/pages/home_page.dart';
import 'package:lumora/features/home/presentation/widgets/card_panduangizi.dart';
import 'package:lumora/features/home/presentation/widgets/card_panduaninfo.dart';
import 'package:lumora/features/home/presentation/widgets/card_rekomendasimenu.dart';
import 'package:lumora/features/home/presentation/widgets/card_tipsgizi.dart';

class Nutriguide extends StatefulWidget {
  const Nutriguide({super.key});

  @override
  State<Nutriguide> createState() => _NutriguideState();
}

class _NutriguideState extends State<Nutriguide> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
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
          "Panduan Gizi",
          style: TextStyle(
            fontSize: sizewidth * 22 / fullwidth,
            fontWeight: FontWeight.w600,
            color: AppColors.txtPrimary,
          ),
        ),
        backgroundColor: AppColors.background,
      ),
      body: MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => PanduanGiziBloc()..add(LoadPanduanGizi()),
    ),
    BlocProvider(
      create: (context) => TipsGiziBloc()..add(LoadTipsGizi()),
    ),
  ],
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: sizewidth * 18 / fullwidth,
              top: sizeheight * 14 / fullheight,
              bottom: sizeheight * 37 / fullheight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: sizewidth * 18 / fullwidth),
                  child: Text(
                    "Rekomendasi asupan untuk Si kecil, Aria!",
                    style: TextStyle(
                      fontSize: sizewidth * 16 / fullwidth,
                      fontWeight: FontWeight.w500,
                      color: AppColors.txtPrimary,
                    ),
                  ),
                ),
                SizedBox(height: sizeheight * 8 / fullheight),
                Container(
                  margin: EdgeInsets.only(right: sizewidth * 18 / fullwidth),
                  padding: EdgeInsets.symmetric(
                    horizontal: sizewidth * 12 / fullwidth,
                    vertical: sizeheight * 8 / fullheight,
                  ),
                  width: sizewidth * 163 / fullwidth,

                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange,
                    borderRadius: BorderRadius.circular(
                      sizewidth * 22 / fullwidth,
                    ),
                  ),
                  child: Text(
                    "Usia: 8 Bulan, 5 Hari",
                    style: TextStyle(
                      fontSize: sizewidth * 14 / fullwidth,
                      fontWeight: FontWeight.w500,
                      color: AppColors.txtPrimary,
                    ),
                  ),
                ),
                SizedBox(height: sizeheight * 17 / fullheight),
                BlocBuilder<PanduanGiziBloc, PanduanGiziState>(
                  builder: (context, state) {
                    if (state is PanduanGiziLoaded) {
                      return PanduanInfoCard(items: state.items, size: size);
                    }
                    return SizedBox.shrink();
                  },
                ),

                SizedBox(height: sizeheight * 32 / fullheight),
                Text(
                  "Panduan Gizi",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: sizewidth * 18 / fullwidth,
                    fontWeight: FontWeight.w500,
                    color: AppColors.txtPrimary,
                  ),
                ),

                SizedBox(height: sizeheight * 9 / fullheight),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(panduanGiziList.length, (index) {
                      final item = panduanGiziList[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index == panduanGiziList.length - 1
                              ? 0
                              : sizewidth * 16 / fullwidth,
                        ),
                        child: CardPanduanGizi(
                          title: item['title']!,
                          portion: item['portion']!,
                          imagePath: item['image']!,
                          size: size,
                          onTap: () {},
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: sizeheight * 29 / fullheight),
                Text(
                  "Rekomendasi Menu Harian",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: sizewidth * 18 / fullwidth,
                    fontWeight: FontWeight.w500,
                    color: AppColors.txtPrimary,
                  ),
                ),

                SizedBox(height: sizeheight * 8 / fullheight),

                CardRekomendasimenu(
                  title: "Oatmeal Sereal",
                  desc:
                      "Teksturnya yang lembut dan rasanya yang enak membuat sereal menjadi makanan yang cocok diberikan untuk bayi berusia 8 bulan.",
                  size: size,
                ),
                SizedBox(height: sizeheight * 8 / fullheight),
                CardRekomendasimenu(
                  title: "Bubur Pisang",
                  desc:
                      "Bubur pisang mengandung protein nabati yang membantu pertumbuhan sel dan otot bayi, serta kaya energi alami yang mendukung aktivitas dan perkembangan hariannya",
                  size: size,
                ),

                SizedBox(height: sizeheight * 22 / fullheight),
                 BlocBuilder<TipsGiziBloc, TipsGiziState>(
                  builder: (context, state) {
                    if (state is TipsGiziLoaded) {
                      return CardTipsgizi(items: state.items, size: size);
                    }
                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
