import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';
import 'package:lumora/features/home/presentation/pages/home_page.dart';
import 'package:lumora/features/home/presentation/widgets/card_analisisresult.dart';
import 'package:lumora/features/home/presentation/widgets/card_topanalisisresult.dart';

class AnalisisresultGood extends StatelessWidget {
  const AnalisisresultGood({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: sizewidth*18/fullwidth, vertical: sizeheight*27/fullheight),
            child: Column(
              children: [
                CardTopanalisisresult(size: size, image: 'assets/images/analisis-good.png', desc1: 'Kerja bagus, parents!', desc2: 'Makanan yang anda berikan sudah cukup bergizi untuk perkembangan Si Kecil.'),
            
                SizedBox(height: sizeheight*28/fullheight,),
            
                AnalisisResult(size: size,),
            
                SizedBox(height: sizeheight*8/fullheight,),
            
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/feet.svg', width: sizewidth*24/fullwidth,),
                    SizedBox(width: sizewidth*3/fullwidth,),
                    Expanded(child: Text("Terima kasih sudah pantau asupan gizi Si Kecil. Pertahankan makanan bergizi seimbang ya, parents.", style: TextStyle(color: AppColors.txtPrimary, fontSize: sizewidth*12/fullwidth, fontWeight: FontWeight.w400),))
                  ],
                ),
            
                 SizedBox(height:sizeheight* 40/fullheight),
            
                         ButtonMedium(
                      text: "Kembali ke halaman utama",
                      width: sizewidth * 327 / fullwidth,
                      height: sizeheight * 45 / fullheight,
                      backgroundColor: AppColors.txtPrimary,
                      borderColor: AppColors.txtPrimary,
                      onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()),
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