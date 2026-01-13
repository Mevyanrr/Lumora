import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/core/widgets/button_medium.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_bloc.dart';
import 'package:lumora/features/kuisioner/presentation/bloc/kuisioner_event.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page3.dart';
import 'package:lumora/features/kuisioner/presentation/widgets/top_container.dart';
import 'package:lumora/core/widgets/textfield.dart';

class Page2View extends StatefulWidget {
  final TextEditingController bbController;
  final TextEditingController tbController;
  final TextEditingController lingkarKepalaController;

  const Page2View({
    super.key,
    required this.bbController,
    required this.tbController,
    required this.lingkarKepalaController,
  });

  @override
  State<Page2View> createState() => _Page2ViewState();
}

class _Page2ViewState extends State<Page2View> {
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
          padding: EdgeInsets.only(top: sizeheight * 77 / fullheight, bottom: sizeheight*61/fullheight),
          child: Column(
            children: [
              TopContainer(
                stepPage: "2 / 4",
                image: "assets/images/kuisioner-2.png",
              ),

              SizedBox(height: sizeheight * 30 / fullheight),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Berat badan saat ini (Kg)",
                      style: TextStyle(
                        color: AppColors.txtPrimary,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: sizeheight * 9 / fullheight),
                    CustomTxtField(
                      labelText: "Masukkan berat badan bayi...",
                      controller: widget.bbController,
                      onChanged: (value) {
                        context.read<KuisionerBloc>().add(IsiNama(value));
                      },
                    ),
                    SizedBox(height: sizeheight * 12 / fullheight),

                    Text(
                      "Tinggi badan saat ini (Cm)",
                      style: TextStyle(
                        color: AppColors.txtPrimary,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: sizeheight * 9 / fullheight),
                    CustomTxtField(
                      labelText: "Masukkan tinggi badan bayi...",
                      controller: widget.tbController,
                      onChanged: (value) {
                        context.read<KuisionerBloc>().add(IsiNama(value));
                      },
                    ),
                    SizedBox(height: sizeheight * 12 / fullheight),

                    Text(
                      "Lingkar kepala saat ini (Cm)",
                      style: TextStyle(
                        color: AppColors.txtPrimary,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: sizeheight * 9 / fullheight),
                    CustomTxtField(
                      labelText: "Jika belum tahu dapat dilewatkan...",
                      controller: widget.lingkarKepalaController,
                      onChanged: (value) {
                        context.read<KuisionerBloc>().add(IsiNama(value));
                      },
                    ),

                    SizedBox(height: sizeheight * 56 / fullheight),

                    ButtonMedium(
                      text: "Lanjutkan",
                      width: sizewidth * 327 / fullwidth,
                      height: sizeheight * 45 / fullheight,
                      backgroundColor: AppColors.txtPrimary,
                      borderColor: AppColors.txtPrimary,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Page3()),
                        );
                      },

                      radius: 15,
                      txColor: AppColors.background,
                    ),

                    SizedBox(height: sizeheight * 12 / fullheight),

                    ButtonMedium(
                      text: "Kembali",
                      width: sizewidth * 327 / fullwidth,
                      height: sizeheight * 45 / fullheight,
                      backgroundColor: AppColors.background,
                      borderColor: AppColors.txtPrimary,
                      onTap: () {
                        Navigator.pop(context);
                      },

                      radius: 15,
                      txColor: AppColors.txtPrimary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
