import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/home/presentation/widgets/card_tahapanbayi.dart';

class TahapanBayi extends StatelessWidget {
  const TahapanBayi({super.key});

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
            weight: sizewidth * 7.5 / fullwidth,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Tahapan Pertumbuhan Bayi",
          style: TextStyle(
            fontSize: sizewidth * 22 / fullwidth,
            fontWeight: FontWeight.w600,
            color: AppColors.txtPrimary,
          ),
        ),
        backgroundColor: AppColors.background,
      ),
      body:SingleChildScrollView(
  child: Padding(
    padding: EdgeInsets.only(
      left: sizewidth * 18 / fullwidth,
      right: sizewidth * 18 / fullwidth,
      top: sizeheight * 10 / fullheight,
      bottom: sizeheight * 37 / fullheight,
    ),
    child: Column(
      children: List.generate(tahapanBayi.length, (index) {
        final item = tahapanBayi[index];

        return Padding(
          padding: EdgeInsets.only(
            bottom: sizeheight * 20 / fullheight,
          ),
          child: CardTahapanbayi(
            header: SvgPicture.asset(
              item["icon"],
              width: sizewidth * 33 / fullwidth,
            ),
            title: item["title"],
            subtitle: item["subtitle"],
            description: item["description"],
            activities: List<String>.from(item["activities"]),
            size: size,
          ),
        );
      }),
    ),
  ),
),

    );
  }
}

final List<Map<String, dynamic>> tahapanBayi = [
  {
    "icon": "assets/icons/growbaby-world.svg",
    "title": "Si Penyesuai Dunia 🌍",
    "subtitle": "Tahap 0 - 2 Bulan",
    "description":
        "Bayi yang baru lahir sedang beradaptasi dengan dunia luar seperti cahaya, suara, sentuhan, dan ritme hidup.",
    "activities": [
      "Sering Tidur",
      "Menangis",
      "Mengenali Suara",
      "Menatap wajah",
      "Menggenggam jari",
    ],
  },
  {
    "icon": "assets/icons/growbaby-star.svg",
    "title": "Si Pengamat",
    "subtitle": "Tahap 3 - 5 Bulan",
    "description":
        "Si kecil mulai aktif mengamati dunia dan menunjukkan ekspresi.",
    "activities": [
      "Tersenyum",
      "Mengikuti gerak benda dengan mata",
      "Memasukkan tangan ke mulut",
      "Bersuara (cooing)",
      "Mengangkat kepala saat tengkurap",
    ],
  },
  {
    "icon": "assets/icons/growbaby-feet.svg",
    "title": "Si Penjelajah",
    "subtitle": "Tahap 6 - 7 Bulan",
    "description":
        "Si kecil mulai ingin bergerak dan mencoba kemampuan fisiknya.",
    "activities": [
      "Berguling",
      "Meraih dan memindahkan benda",
      "Mengenali orang",
      "Bersuara berulang",
    ],
  },

  {
    "icon": "assets/icons/growbaby-feet.svg",
    "title": "Si Penasaran",
    "subtitle": "Tahap 8 - 10 Bulan",
    "description":
        "Si kecil mulai aktif mengeksplorasi sekitar dengan merangkak dan memahami konsep sebab-akibat sederhana.",
    "activities": [
    "Merangkak atau mengesot",
    "Duduk tanpa bantuan",
    "Melambaikan tangan (dadah)",
    "Memegang biskuit sendiri",
    
    ],
  },
];

