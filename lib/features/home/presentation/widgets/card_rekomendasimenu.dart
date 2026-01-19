import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

class CardRekomendasimenu extends StatelessWidget {
  final String title;
  final String desc;
  final Size size;
  const CardRekomendasimenu({super.key, required this.title, required this.desc, required this.size});

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return Container(
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
        child: 
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: sizewidth * 16 / fullwidth,
                    fontWeight: FontWeight.w500,
                    color: AppColors.txtPrimary,
                  ),
                ),
                SizedBox(height: sizeheight*4/fullheight,),
                Text(
                  desc,
                  // softWrap: true,
                  // maxLines: null,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: sizewidth * 14 / fullwidth,
                    fontWeight: FontWeight.w400,
                    color: AppColors.txtPrimary,
                  ),
                ),
              ],
            ),
        
      
      ),
    );
  }
}
