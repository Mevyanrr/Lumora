import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';
import 'package:lumora/features/home/presentation/pages/home_page.dart';
import 'package:lumora/features/home/presentation/widgets/card_topanalisisresult.dart';
// Pastikan import DynamicGiziBar ada (jika dipisah file) atau copy widgetnya ke sini juga

class AnalisisresultGood extends StatelessWidget {
  // 1. Terima Data
  final Map<String, dynamic> data;

  const AnalisisresultGood({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;

    // 2. Parsing Data
    final titleText = data['title_text'] ?? "Kerja bagus, parents!";
    final stats = data['analisis_gizi'] ?? {};

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sizewidth * 18 / fullwidth,
              vertical: sizeheight * 27 / fullheight
            ),
            child: Column(
              children: [
                CardTopanalisisresult(
                  size: size,
                  image: 'assets/images/analisis-good.png',
                  desc1: titleText,
                  desc2: 'Makanan yang anda berikan sudah cukup bergizi untuk perkembangan Si Kecil.',
                ),

                SizedBox(height: sizeheight * 28 / fullheight),

                // 3. Tampilkan Grafik Gizi juga (Sebagai bukti sudah terpenuhi)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green[50], // Background agak hijau muda
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        "Analisis Gizi Menu",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600, 
                          fontSize: sizewidth * 16 / fullwidth
                        ),
                      ),
                      SizedBox(height: 16),
                      // Helper widget yang sama (copy dari file bad result atau buat file terpisah)
                      DynamicGiziBar(label: "Karbohidrat", data: stats['karbohidrat'], color: Colors.teal),
                      DynamicGiziBar(label: "Protein", data: stats['protein'], color: Colors.pinkAccent),
                      DynamicGiziBar(label: "Vitamin", data: stats['vitamin'], color: Colors.orange),
                      DynamicGiziBar(label: "Cairan", data: stats['cairan'], color: Colors.blue),
                    ],
                  ),
                ),

                SizedBox(height: sizeheight * 8 / fullheight),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/feet.svg',
                      width: sizewidth * 24 / fullwidth,
                    ),
                    SizedBox(width: sizewidth * 3 / fullwidth),
                    Expanded(
                      child: Text(
                        "Terima kasih sudah pantau asupan gizi Si Kecil. Pertahankan makanan bergizi seimbang ya, parents.",
                        style: TextStyle(
                          color: AppColors.txtPrimary,
                          fontSize: sizewidth * 12 / fullwidth,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    )
                  ],
                ),

                SizedBox(height: sizeheight * 40 / fullheight),

                ButtonMedium(
                  text: "Kembali ke halaman utama",
                  width: sizewidth * 327 / fullwidth,
                  height: sizeheight * 45 / fullheight,
                  backgroundColor: AppColors.txtPrimary,
                  borderColor: AppColors.txtPrimary,
                  onTap: () {
                     Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                        (route) => false,
                      );
                  },
                  radius: 15,
                  txColor: AppColors.background,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DynamicGiziBar extends StatelessWidget {
  final String label;
  final dynamic data; 
  final Color color;

  const DynamicGiziBar({
    super.key, 
    required this.label, 
    required this.data, 
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    // Parsing data aman
    int persen = 0;
    String menu = "Tidak ada";
    
    if (data != null && data is Map) {
      persen = data['persen'] ?? 0;
      menu = data['menu_penunjang'] ?? "Tidak ada";
    }

    bool isMissing = menu.toLowerCase() == "tidak ada";
    bool isGood = persen >= 75;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    label,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    isGood ? Icons.check_circle : Icons.error,
                    size: 16,
                    color: isGood ? Colors.green : Colors.grey,
                  ),
                ],
              ),
              Text("$persen%", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
          Text(
            "Menu Penunjang: $menu",
            style: TextStyle(
              fontSize: 11,
              color: isMissing ? Colors.red : Colors.grey[700],
              fontStyle: isMissing ? FontStyle.italic : FontStyle.normal,
            ),
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: persen / 100.0,
              backgroundColor: Colors.white,
              color: isGood ? color : Colors.grey,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}