import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

class Exit extends StatelessWidget {
  const Exit({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return AlertDialog(
      
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(sizewidth* 15/fullwidth),
      ),
      
      content: SizedBox(
        width:sizewidth* 250/fullwidth,
        height:sizeheight* 128/fullheight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Anda yakin ingin keluar dari aplikasi?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize:sizewidth* 16/fullwidth,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
        
           SizedBox(height:sizeheight* 18/fullheight),
        
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.txtPrimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(sizewidth*50/fullwidth),
                      ),
                    ),
                    child: Text(
                      "Ya",
                      style: TextStyle(
                        color: AppColors.txtPrimary,
                      ),
                    ),
                  ),
                ),
        
                SizedBox(width:sizewidth* 12/fullwidth),
        
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.txtPrimary,
                      shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(sizewidth*50/fullwidth),
                      ),
                    ),
                    child: Text(
                      "Tidak",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showExitAlert(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, 
    builder: (context) {
      return const Exit();
    },
  );
}

