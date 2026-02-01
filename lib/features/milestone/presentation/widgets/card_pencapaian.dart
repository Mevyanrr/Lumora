import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/milestone/presentation/pages/nextstep.dart';
import '../cubit/pencapaian_cubit.dart';

class CardPencapaian extends StatelessWidget {
  final Size size;
  const CardPencapaian({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final sw = size.width;
    final sh = size.height;
    final fw = 412;
    final fh = 917;

    return BlocBuilder<PencapaianCubit, PencapaianStatus>(
      builder: (context, state) {
        final isBelum = state == PencapaianStatus.belum;
        final isInitial = state == PencapaianStatus.initial;

        Color indicatorColor = AppColors.txtSecondary;
        if (state == PencapaianStatus.dapat) {
          indicatorColor = AppColors.green;
        } else if (state == PencapaianStatus.belum) {
          indicatorColor = AppColors.secondary;
        }

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: sw * 8 / fw,
                      decoration: BoxDecoration(
                        color: indicatorColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                
                    SizedBox(width: sw * 7 / fw),
                
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: sw * 361 / fw,
                            padding: EdgeInsets.symmetric(
                              vertical: sh * 12 / fh,
                              horizontal: sw * 16 / fw,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryOrange,
                              borderRadius: BorderRadius.circular(sw * 15 / fw),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Memindahkan satu barang ke tempat lain ke tempat lain",
                                  style: TextStyle(
                                      fontSize: sw * 16 / fw,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.txtPrimary),
                                ),
                                SizedBox(height: sh * 12 / fh),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: sw * 5 / fw),
                                  height: sh * 52 / fh,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(sw * 63 / fw),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => context
                                            .read<PencapaianCubit>()
                                            .pilihDapat(),
                                        child: Container(
                                          width: sw * 199 / fw,
                                          height: sh * 40 / fh,
                                          decoration: BoxDecoration(
                                            color:
                                                state == PencapaianStatus.dapat ||
                                                        isInitial
                                                    ? AppColors.green
                                                    : AppColors.background,
                                            borderRadius:
                                                BorderRadius.circular(sw * 28 / fw),
                                          ),
                                          child: Center(
                                            child: Text("Dapat dilakukan"),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: sw * 8 / fw),
                                      GestureDetector(
                                        onTap: () => context
                                            .read<PencapaianCubit>()
                                            .pilihBelum(),
                                        child: Container(
                                          width: sw * 95 / fw,
                                          height: sh * 40 / fh,
                                          decoration: BoxDecoration(
                                            color:
                                                state == PencapaianStatus.belum ||
                                                        isInitial
                                                    ? AppColors.secondary
                                                    : AppColors.background,
                                            borderRadius:
                                                BorderRadius.circular(sw * 28 / fw),
                                          ),
                                          child: Center(
                                            child: Text("Belum"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                
                          if (isBelum) ...[
                            SizedBox(height: sh * 10 / fh),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => Nextstep()),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: sw*12/fw),
                                height: sh * 46 / fh,
                                decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius: BorderRadius.circular(sw * 14 / fw),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/nutriguide-warning.svg",
                                      width: sw * 30 / fw,
                                      colorFilter: ColorFilter.mode(
                                        AppColors.background,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    Text(
                                      "Lihat langkah lanjutan",
                                      style: TextStyle(
                                          color: AppColors.background,
                                          fontSize: sw * 16 / fw,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: AppColors.background,
                                      size: sw *20 / fw,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
