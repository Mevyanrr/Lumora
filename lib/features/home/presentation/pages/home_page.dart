import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:lumora/features/home/services/gemini_analysis_service.dart'; // Import Service
import 'package:lumora/features/kuisioner/services/kuisioner_service.dart';
import 'package:lumora/features/profile/presentation/pages/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GeminiAnalysisService _geminiService = GeminiAnalysisService();
  late Future<Map<String, dynamic>> _nutritionDataFuture;

  @override
  void initState() {
    super.initState();
    _nutritionDataFuture = _geminiService.analyzeGrowthData();
  }

  String _getIcon(String kategori) {
    final k = kategori.toLowerCase();
    if (k.contains('buah')) return 'assets/images/pisang.png';
    if (k.contains('sayur')) return 'assets/images/sayur.png';
    if (k.contains('protein')) return 'assets/images/ayam.png';
    if (k.contains('karbo')) return 'assets/images/kentang.png';
    return 'assets/images/biji.png'; 
  }

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
              top: sizeheight * 10 / fullheight,
              bottom: sizeheight * 15 / fullheight,
            ),
            child: StreamBuilder(
                stream: KuisionerService().getKuisionerData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final babyData = snapshot.data;
                  if (babyData == null) {
                    return const Center(child: Text("Silahkan isi data bayi terlebih dahulu"));
                  }
                  
                  String babyName = babyData.nama;
                  final now = DateTime.now();
                  int bulan = now.month - babyData.tanggalLahir.month +
                      (12 * (now.year - babyData.tanggalLahir.year));
                  int hari = now.day - babyData.tanggalLahir.day;

                  if (hari < 0) {
                    bulan--;
                    hari += 30;
                  }

                  String intervalTahap = switch (bulan) {
                    >= 0 && <= 2 => "Tahap 0 - 2 Bulan: ",
                    >= 3 && <= 5 => "Tahap 3 - 5 Bulan: ",
                    >= 6 && <= 7 => "Tahap 6 - 7 Bulan: ",
                    >= 8 && <= 10 => "Tahap 8 - 10 Bulan: ",
                    _ => "Tahap 12 bulan keatas",
                  };

                  String tahap = switch (bulan) {
                    >= 0 && <= 2 => "Si Penyesuai Dunia",
                    >= 3 && <= 5 => "Si Pengamat",
                    >= 6 && <= 7 => "Si Penjelajah",
                    >= 8 && <= 10 => "Si Penasaran",
                    _ => "Si kreatif",
                  };

                  String deskripsi = switch (bulan) {
                    >= 0 && <= 2 =>
                      "Pada fase ini, fokuslah pada pemberian ASI eksklusif dan bangun ikatan batin",
                    >= 3 && <= 5 =>
                      "Pada fase ini, ajak si kecil berinteraksi dengan mainan yang bisa digenggam",
                    >= 6 && <= 7 =>
                      "Pada fase ini, kenalkan MPASI pertama dengan tekstur halus",
                    >= 8 && <= 10 =>
                      "Pada fase ini, ajak si kecil mengeksplorasi lingkungan sekitarnya dengan merangkak",
                    _ =>
                      "Pada fase ini, terus pantau tumbuh kembang si kecil dan berikan stimulasi sesuai usia",
                  };

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: sizewidth * 20 / fullwidth),
                        height: sizeheight * 64 / fullheight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                                  
                              },
                              child: CircleAvatar(
                                radius: sizewidth * 24 / fullwidth,
                                backgroundImage: AssetImage("assets/images/profildummy.png"),
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
                              crossAxisAlignment: CrossAxisAlignment.start, 
                              children: [
                                Row(
                                  children: [
                                    Text("Bayiku, ",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: sizewidth * 22 / fullwidth,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.txtPrimary)),
                                    Text("$babyName",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: sizewidth * 22 / fullwidth,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.txtPrimary)),
                                  ],
                                ),
                                SizedBox(height: sizeheight * 5 / fullheight),
                                Row(
                                  children: [
                                    Text("Usia: ",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: sizewidth * 14 / fullwidth,
                                            color: AppColors.txtPrimary)),
                                    Text("$bulan bulan $hari hari",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: sizewidth * 14 / fullwidth,
                                            color: AppColors.txtPrimary)),
                                  ],
                                ),
                              ],
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("$intervalTahap ",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: sizewidth * 10 / fullwidth, 
                                        color: AppColors.txtPrimary)),
                                SizedBox(height: sizeheight * 4 / fullheight),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TahapanBayi()));
                                  },
                                  child: Text("$tahap >",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: sizewidth * 16 / fullwidth,
                                          fontWeight: FontWeight.w500, 
                                          color: AppColors.primaryBlue)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: sizeheight * 14 / fullheight),

                      CardHiparents(desc: "$deskripsi", size: size),
                      
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
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const Nutriguide()));
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

                      FutureBuilder<Map<String, dynamic>>(
                        future: _nutritionDataFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return SizedBox(
                              height: 120, 
                              child: Center(child: CircularProgressIndicator(color: AppColors.primaryOrange)),
                            );
                          }
                          
                          List<dynamic> porsiList = [];
                          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                            porsiList = snapshot.data!['panduan_porsi'] as List? ?? [];
                          }

                          if (porsiList.isEmpty) {
                            return const Text("Data gizi tidak tersedia.");
                          }
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(porsiList.length, (index) {
                                final item = porsiList[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: index == porsiList.length - 1 ? 0 : sizewidth * 16 / fullwidth,
                                  ),
                                  child: CardPanduanGizi(
                                    title: item['kategori'],
                                    portion: item['porsi'], 
                                    imagePath: _getIcon(item['kategori']),
                                    size: size,
                                    onTap: () {
                                       Navigator.push(context, MaterialPageRoute(builder: (_) => const Nutriguide()));
                                    },
                                  ),
                                );
                              }),
                            ),
                          );
                        },
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
                          Icon(Icons.arrow_downward_outlined, color: AppColors.txtPrimary, size: 16),
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
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const Analisis()));
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DataBayi()));
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
                        child: GrowthdataCard(
                          beratStatus: GrowthStatus.normal, 
                          tinggiStatus: GrowthStatus.kurang,
                          kepalaStatus: GrowthStatus.normal,
                          size: size,
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
                                right: index == infoList.length - 1 ? 0 : sizewidth * 16 / fullwidth,
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
                  );
                }),
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(selectedItem: 0),
    );
  }
}

final infoList = [
  {
    "title": "Nutrisi dan Berat Badan",
    "desc": "Berat badan yang seimbang juga menentukan kesehatan",
    "image": "assets/images/info-kes-doll.png",
  },
  {
    "title": "Pentingnya ASI Eksklusif",
    "desc": "ASI adalah makanan terbaik bagi bayi 0-6 bulan",
    "image": "assets/images/info-kes-milk.png",
  },
  {
    "title": "Jadwal Imunisasi",
    "desc": "Cek jadwal imunisasi wajib untuk si kecil",
    "image": "assets/images/info-kes-doll.png",
  },
];