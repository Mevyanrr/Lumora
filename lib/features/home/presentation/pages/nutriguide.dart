import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Pastikan import svg ada
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/home/presentation/widgets/card_panduangizi.dart';
import 'package:lumora/features/home/presentation/widgets/card_rekomendasimenu.dart';
import 'package:lumora/features/home/presentation/widgets/card_tipsgizi.dart';
import 'package:lumora/features/home/data/models/tipsgizi_item.dart'; 
import 'package:lumora/features/home/services/gemini_analysis_service.dart';

class Nutriguide extends StatefulWidget {
  const Nutriguide({super.key});

  @override
  State<Nutriguide> createState() => _NutriguideState();
}

class _NutriguideState extends State<Nutriguide> {
  final GeminiAnalysisService _geminiAnalysisService = GeminiAnalysisService();
  late Future<Map<String, dynamic>> _geminiAnalysisFuture;

  @override
  void initState() {
    super.initState();
    _geminiAnalysisFuture = _geminiAnalysisService.analyzeGrowthData();
  }

  String _getIcon(String kategori) {
    final k = kategori.toLowerCase();
    if (k.contains('buah')) return 'assets/images/pisang.png';
    if (k.contains('sayur')) return 'assets/images/sayur.png'; 
    if (k.contains('protein')) return 'assets/images/ayam.png';
    if (k.contains('karbo')) return 'assets/images/kentang.png';
    return 'assets/images/pisang.png';
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.txtPrimary,
            size: sizewidth * 20 / fullwidth, // Adjusted size
          ),
          onPressed: () => Navigator.pop(context),
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
        elevation: 0,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _geminiAnalysisFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: AppColors.primaryOrange),
                  const SizedBox(height: 16),
                  Text("Sedang meracik rekomendasi gizi...", style: TextStyle(color: AppColors.txtPrimary)),
                ],
              ),
            );
          }

          if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Gagal memuat data. Periksa koneksi internet atau coba lagi nanti.\nError: ${snapshot.error}",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final data = snapshot.data!;
          

          final String namaAnak = data['nama_fix'] ?? "Si Kecil";
          final String usiaDetail = data['usia_fix'] ?? "-";
          
          final checklist = data['checklist_rekomendasi'] as List;
          final porsiList = data['panduan_porsi'] as List;
          final menuList = data['menu_harian'] as List;
          

          final rawTips = data['tips_gizi'] as List;
          final List<TipsGiziItem> tipsItems = rawTips.map((textString) {
            return TipsGiziItem(text: textString.toString());
          }).toList();

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: sizewidth * 18 / fullwidth,
                right: sizewidth * 18 / fullwidth,
                top: sizeheight * 14 / fullheight,
                bottom: sizeheight * 37 / fullheight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- HEADER NAMA (Dari Gemini) ---
                  Text(
                    "Rekomendasi asupan untuk $namaAnak!",
                    style: TextStyle(
                      fontSize: sizewidth * 16 / fullwidth,
                      fontWeight: FontWeight.w500,
                      color: AppColors.txtPrimary,
                    ),
                  ),
                  SizedBox(height: sizeheight * 8 / fullheight),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: sizewidth * 12 / fullwidth,
                      vertical: sizeheight * 8 / fullheight,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryOrange,
                      borderRadius: BorderRadius.circular(sizewidth * 22 / fullwidth),
                    ),
                    child: Text(
                      "Usia: $usiaDetail",
                      style: TextStyle(
                        fontSize: sizewidth * 14 / fullwidth,
                        fontWeight: FontWeight.w500,
                        color: AppColors.txtPrimary,
                      ),
                    ),
                  ),
                  
                  SizedBox(height: sizeheight * 17 / fullheight),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                         BoxShadow(
                           color: Colors.black.withOpacity(0.05), 
                           blurRadius: 10, 
                           offset: const Offset(0, 4)
                         )
                      ],
                    ),
                    child: Column(
                      children: checklist.map((item) {
                        bool isWarning = item['is_warning'] ?? false;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                isWarning ? Icons.error_outline : Icons.check_circle_outline,
                                color: isWarning ? Colors.red : Colors.green,
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  item['text'],
                                  style: TextStyle(
                                    fontSize: 14, 
                                    color: AppColors.txtPrimary
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
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

                  Column(
                    children: menuList.map((menu) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: sizeheight * 8 / fullheight),
                        child: CardRekomendasimenu(
                          title: menu['nama_menu'],
                          desc: menu['deskripsi'],
                          size: size,
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: sizeheight * 22 / fullheight),

                  CardTipsgizi(
                    items: tipsItems, 
                    size: size
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}