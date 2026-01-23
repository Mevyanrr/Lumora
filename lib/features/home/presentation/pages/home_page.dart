import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';
import 'package:lumora/core/widgets/navbar.dart';
import 'package:lumora/features/home/presentation/pages/analisis.dart';
import 'package:lumora/features/home/presentation/pages/data_bayi.dart';
import 'package:lumora/features/home/presentation/pages/nutriguide.dart';
import 'package:lumora/features/home/presentation/pages/tahapan_bayi.dart';
import 'package:lumora/features/home/presentation/widgets/card_growthdata.dart';
import 'package:lumora/features/home/presentation/widgets/card_hiparents.dart';
import 'package:lumora/features/home/presentation/widgets/card_infokesehatan.dart';
import 'package:lumora/features/home/presentation/widgets/card_panduangizi.dart';
import 'package:lumora/features/profile/presentation/pages/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: sizewidth * 20 / fullwidth,
              top: sizeheight * 22 / fullheight,
              bottom: sizeheight * 15 / fullheight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(right: sizewidth * 20 / fullwidth),
                  height: sizeheight * 64 / fullheight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Beranda",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: sizewidth * 22 / fullwidth,
                          fontWeight: FontWeight.w600,
                          color: AppColors.txtPrimary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(),
                                ),
                              );
                        },
                        child: CircleAvatar(
                          radius: sizewidth * 24 / fullwidth,
                          backgroundImage: AssetImage(
                            "assets/images/profildummy.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        
                SizedBox(height: sizeheight * 12 / fullheight),
                Container(
                  padding: EdgeInsets.only(right: sizewidth * 20 / fullwidth),
                  height: sizeheight * 74 / fullheight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Bayiku, ",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: sizewidth * 22 / fullwidth,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.txtPrimary,
                                ),
                              ),
                              //BABY NAME
                              Text(
                                "Aira",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: sizewidth * 22 / fullwidth,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.txtPrimary,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: sizeheight * 10 / fullheight),
                          Row(
                            children: [
                              Text(
                                "Usia: ",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: sizewidth * 14 / fullwidth,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.txtPrimary,
                                ),
                              ),
                              //BUAT UMUR BAYI
                              Text(
                                "8 bulan 5 hari",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: sizewidth * 14 / fullwidth,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.txtPrimary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Tahap 8 - 10 Bulan:",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: sizewidth * 12 / fullwidth,
                              fontWeight: FontWeight.w400,
                              color: AppColors.txtPrimary,
                            ),
                          ),
                          SizedBox(height: sizeheight * 6 / fullheight),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TahapanBayi(),
                                ),
                              );
                            },
                            child: Text(
                              "Si Penasaran >",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: sizewidth * 18 / fullwidth,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        
                SizedBox(height: sizeheight * 14 / fullheight),
        
                CardHiparents(
                  desc:
                      "Pada fase ini ajak anak anda mengeksplorasi lingkungan di sekitarnya yaa",
                  size: size,
                ),
                SizedBox(height: sizeheight * 28 / fullheight),
                Padding(
                  padding: EdgeInsets.only(right: sizewidth * 20 / fullwidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Panduan Gizi",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: sizewidth * 18 / fullwidth,
                          fontWeight: FontWeight.w500,
                          color: AppColors.txtPrimary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Nutriguide()),
                          );
                        },
                        child: Text(
                          "Selengkapnya >",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: sizewidth * 14 / fullwidth,
                            fontWeight: FontWeight.w500,
                            color: AppColors.txtPrimary,
                          ),
                        ),
                      ),
                    ],
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
        
                SizedBox(height: sizeheight * 12 / fullheight),
                Row(
                  children: [
                    Text(
                      "Yuk, cek asupan gizi makanan Si kecil hari ini",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: sizewidth * 14 / fullwidth,
                        fontWeight: FontWeight.w400,
                        color: AppColors.txtPrimary,
                      ),
                    ),
        
                    SizedBox(width: sizewidth * 4 / fullwidth),
        
                    Icon(
                      Icons.arrow_downward_outlined,
                      color: AppColors.txtPrimary,
                    ),
                  ],
                ),
                SizedBox(height: sizeheight * 8 / fullheight),
                Center(
                  child: ButtonMedium(
                    text: "Analisis gizi menu masakan >",
                    width: sizewidth * 327 / fullwidth,
                    height: sizeheight * 42 / fullheight,
                    backgroundColor: AppColors.txtPrimary,
                    borderColor: AppColors.txtPrimary,
                    onTap: () {
                      Navigator.push(
                         context,
                         MaterialPageRoute(builder: (_) => Analisis()),
                       );
                    },
        
                    radius: 15,
                    txColor: AppColors.background,
                  ),
                ),
        
                SizedBox(height: sizeheight * 32 / fullheight),
        
                Padding(
                  padding: EdgeInsets.only(right: sizewidth * 20 / fullwidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Data Perkembangan Bayi",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: sizewidth * 18 / fullwidth,
                          fontWeight: FontWeight.w500,
                          color: AppColors.txtPrimary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DataBayi()),
                          );
                        },
                        child: Text(
                          "Edit Data >",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: sizewidth * 14 / fullwidth,
                            fontWeight: FontWeight.w500,
                            color: AppColors.txtPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        
                SizedBox(height: sizeheight * 8 / fullheight),
        
                Padding(
                  padding: EdgeInsets.only(right: sizewidth * 20 / fullwidth),
                  child: Column(
                    children: [
                      GrowthdataCard(
                        beratStatus: GrowthStatus.normal,
                        tinggiStatus: GrowthStatus.kurang,
                        kepalaStatus: GrowthStatus.normal,
                        size: size,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: sizeheight * 32 / fullheight),
                Text(
                  "Informasi Kesehatan Bayi",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: sizewidth * 18 / fullwidth,
                    fontWeight: FontWeight.w500,
                    color: AppColors.txtPrimary,
                  ),
                ),
        
                SizedBox(height: sizeheight * 8 / fullheight),
        
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(infoList.length, (index) {
                      final item = infoList[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index == infoList.length - 1
                              ? 0
                              : sizewidth * 16 / fullwidth,
                        ),
                        child: CardInfokesehatan(
                          title: item['title']!,
                          desc: item['desc']!,
                          imagePath: item['image']!,
                          size: size,
                          onTap: () {},
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Navbar(selectedItem: 0),
    );
  }
}

final panduanGiziList = [
  {
    "title": "Buah",
    "portion": "1-2 Porsi",
    "image": "assets/images/pisang.png",
  },
  {
    "title": "Sayuran",
    "portion": "1-2 Porsi",
    "image": "assets/images/sayur.png",
  },
  {
    "title": "Protein",
    "portion": "1-2 Porsi",
    "image": "assets/images/ayam.png",
  },
  {
    "title": "Karbo",
    "portion": "1-2 Porsi",
    "image": "assets/images/kentang.png",
  },
  {
    "title": "Biji-bijian",
    "portion": "1-2 Porsi",
    "image": "assets/images/biji.png",
  },
];

final infoList = [
  {
    "title": "Nutrisi dan Berat Badan",
    "desc": "Berat badan yang seimbang juga menentukan kesehatan",
    "image": "assets/images/info-kes-doll.png",
  },
  {
    "title": "Nutrisi dan Berat Badan",
    "desc": "Berat badan yang seimbang juga menentukan kesehatan",
    "image": "assets/images/info-kes-milk.png",
  },
  {
    "title": "Nutrisi dan Berat Badan",
    "desc": "Berat badan yang seimbang juga menentukan kesehatan",
    "image": "assets/images/info-kes-doll.png",
  },
];
