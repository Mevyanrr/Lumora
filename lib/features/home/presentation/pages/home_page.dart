import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';
import 'package:lumora/core/widgets/navbar.dart';
import 'package:lumora/features/home/presentation/widgets/card_growthdata.dart';
import 'package:lumora/features/home/presentation/widgets/card_infokesehatan.dart';
import 'package:lumora/features/home/presentation/widgets/card_panduangizi.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: sizewidth * 20 / fullwidth,
            right: sizewidth * 20 / fullwidth,
            top: sizeheight * 89 / fullheight,
            bottom: sizeheight * 15 / fullheight,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
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
                      onTap: () {},
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
              SizedBox(
                height: sizeheight * 74 / fullheight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Bayiku, Aira",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: sizewidth * 22 / fullwidth,
                            fontWeight: FontWeight.w600,
                            color: AppColors.txtPrimary,
                          ),
                        ),
                        SizedBox(height: sizeheight * 10 / fullheight),
                        Text(
                          "Usia: 8 bulan 5 hari",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: sizewidth * 14 / fullwidth,
                            fontWeight: FontWeight.w400,
                            color: AppColors.txtPrimary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Tahap ",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: sizewidth * 12 / fullwidth,
                                fontWeight: FontWeight.w400,
                                color: AppColors.txtPrimary,
                              ),
                            ),
                            Text(
                              "8 - 10 Bulan:",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: sizewidth * 12 / fullwidth,
                                fontWeight: FontWeight.w400,
                                color: AppColors.txtPrimary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: sizeheight * 6 / fullheight),
                        GestureDetector(
                          onTap: () {
                            //PAGE TAHAPAN PERTUMBUHAN BAYI
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

              Container(
                height: sizeheight * 146 / fullheight,
                width: sizewidth * 376 / fullwidth,
                decoration: BoxDecoration(
                  color: AppColors.primaryOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: sizewidth * 16 / fullwidth,
                    vertical: sizeheight * 12 / fullheight,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Hi, Parents!",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: sizewidth * 18 / fullwidth,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.txtPrimary,
                                ),
                              ),
                              SizedBox(width: sizewidth * 5 / fullwidth),
                              SvgPicture.asset(
                                "assets/icons/star.svg",
                                width: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: sizewidth * 213 / fullwidth,
                            height: sizeheight * 66 / fullheight,
                            child: Text(
                              "Pada fase ini ajak anak anda mengeksplorasi lingkungan di sekitarnya yaa",
                              softWrap: true,
                              maxLines: null,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: sizewidth * 14 / fullwidth,
                                fontWeight: FontWeight.w400,
                                color: AppColors.txtPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/images/baby-homepage.png",
                        width: sizewidth * 122 / fullwidth,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: sizeheight * 28 / fullheight),
              Row(
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
                      //PANDUAN GIZI
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

              SizedBox(height: sizeheight*9/fullheight,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CardPanduanGizi(
                      title: "Buah",
                      portion: "1-2 Porsi",
                      imagePath: "assets/images/pisang.png",
                    ),
                    SizedBox(width: sizewidth* 12/fullwidth),
                    CardPanduanGizi(
                      title: "Sayuran",
                      portion: "1-2 Porsi",
                      imagePath: "assets/images/sayur.png",
                    ),
                    SizedBox(width: sizewidth* 12/fullwidth),
                    CardPanduanGizi(
                      title: "Protein",
                      portion: "1-2 Porsi",
                      imagePath: "assets/images/ayam.png",
                    ),
                    SizedBox(width: sizewidth* 12/fullwidth),
                    CardPanduanGizi(
                      title: "Karbo",
                      portion: "1-2 Porsi",
                      imagePath: "assets/images/kentang.png",
                    ),
                    SizedBox(width: sizewidth* 12/fullwidth),
                    CardPanduanGizi(
                      title: "Biji-bijian",
                      portion: "1-2 Porsi",
                      imagePath: "assets/images/biji.png",
                    ),
                  ],
                ),
              ),

              SizedBox(height: sizeheight*12/fullheight,),
              Row(
                children: [
                  Text("Yuk, cek asupan gizi makanan Si kecil hari ini", style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: sizewidth*14/fullwidth,
                    fontWeight: FontWeight.w400,
                    color: AppColors.txtPrimary
                  ),),

                  SizedBox(width: sizewidth* 4/fullwidth),

                  Icon(Icons.arrow_downward_outlined, color: AppColors.txtPrimary)
                ],
              ),
              SizedBox(height: sizeheight*8/fullheight,),
              Center(
                child: ButtonMedium(
                          text: "Analisis gizi menu masakan >",
                          width: sizewidth * 327 / fullwidth,
                          height: sizeheight * 42 / fullheight,
                          backgroundColor: AppColors.txtPrimary,
                          borderColor: AppColors.txtPrimary,
                          onTap: () {
                            
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (_) => Page1()), // KE HOMEPAGE
                            // );
                          },
                        
                          radius: 15,
                          txColor: AppColors.background,
                        ),
              ),

                      SizedBox(height: sizeheight*32/fullheight,),

                      Row(
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
                      //EDIT DATA
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

              SizedBox(height: sizeheight*8/fullheight,), 

              GrowthdataCard(),

              SizedBox(height: sizeheight*8/fullheight,),

              Container(
                height: sizeheight*52/fullheight,
                width: sizewidth*376/fullwidth,
                padding: EdgeInsets.symmetric(horizontal: sizewidth*16/fullwidth, vertical: sizeheight*8/fullheight),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/home-lamp.svg"),
                    SizedBox(width: sizewidth*15/fullwidth),
                    Text("Lingkar Kepala membantu memantau\npertumbuhan otak bayi.", style: TextStyle(
                      fontSize: sizewidth*12/fullwidth,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white
                    ),)
                  ],
                ),
              ),
              SizedBox(height: sizeheight*32/fullheight,),
              Text("Informasi Kesehatan Bayi", 
              style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: sizewidth * 18 / fullwidth,
                      fontWeight: FontWeight.w500,
                      color: AppColors.txtPrimary,
                    ),),

                    SizedBox(height: sizeheight*8/fullheight,),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(selectedItem: 0),
    );
  }
}
