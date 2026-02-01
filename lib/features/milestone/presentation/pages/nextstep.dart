import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/milestone/presentation/bloc/nextstep_bloc.dart';
import 'package:lumora/features/milestone/presentation/bloc/nextstep_state.dart';
import 'package:lumora/features/milestone/presentation/widgets/card_nextstep1.dart';
import 'package:lumora/features/milestone/presentation/widgets/card_nextstep2.dart';
import 'package:lumora/features/milestone/presentation/widgets/card_nextstep3.dart';

class Nextstep extends StatelessWidget {
  const Nextstep({super.key});

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
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Langkah Lanjutan",
          style: TextStyle(
            fontSize: sizewidth * 22 / fullwidth,
            fontWeight: FontWeight.w600,
            color: AppColors.txtPrimary,
          ),
        ),
        backgroundColor: AppColors.background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizewidth * 18 / fullwidth,
              vertical: sizeheight * 17 / fullheight),
          child: Column(
            children: [
              Text(
                "Pertumbuhan setiap anak memang berbeda-beda. Jadi jangan terlalu panik ya, parent!",
                style: TextStyle(
                    fontSize: sizewidth * 14 / fullwidth,
                    fontWeight: FontWeight.w400,
                    color: AppColors.txtPrimary),
              ),

              SizedBox(
                height: sizeheight * 21 / fullheight,
              ),

              BlocBuilder<NextstepBloc, NextstepState>(
                builder: (context, state) {
                  if (state is NextstepLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is NextstepLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardNextstep1(
                          size: size,
                          desc: state.desc,
                          img: state.img,
                        ),
                        SizedBox(
                          height: sizeheight * 24 / fullheight,
                        ),
                        CardNextstep2(
                          size: size,
                          title: state.rekomendasi.title,
                          recommendations: state.rekomendasi.recommendations,
                          infos: state.rekomendasi.info,
                        ),

                         SizedBox(
                          height: sizeheight * 24 / fullheight,
                        ),

                        CardNextstep3(size: size, data: state.note)
                      ],
                    );
                  }

                  return const SizedBox();
                },
              ),

              //3
            ],
          ),
        ),
      ),
    );
  }
}
