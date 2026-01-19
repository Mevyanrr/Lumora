import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/home/presentation/bloc/analisisresult_bloc.dart';
import 'package:lumora/features/home/presentation/bloc/analisisresult_event.dart';
import 'package:lumora/features/home/presentation/bloc/analisisresult_state.dart';

class AnalisisResult extends StatelessWidget {
  final Size size;
  const AnalisisResult({super.key,
  required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return BlocProvider(
      create: (_) => AnalisisresultBloc()..add(LoadAnalisisresult()),
      child: BlocBuilder<AnalisisresultBloc, AnalisisresultState>(
        builder: (context, state) {
          if (state is! AnalisisresultLoaded) {
            return Center(child: CircularProgressIndicator());
          }

          return Container(
            width:sizewidth* 376/fullwidth,
            padding: EdgeInsets.fromLTRB(18, 12, 18, 12),
            decoration: BoxDecoration(
              color: AppColors.primaryOrange,
              borderRadius: BorderRadius.circular(sizewidth* 12/fullwidth),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Analisis Gizi Menu',
                  style: TextStyle(
                    fontSize:sizewidth* 18/fullwidth,
                    fontWeight: FontWeight.w500,
                    color: AppColors.txtPrimary
                  ),
                ),
                SizedBox(height:sizeheight* 12/fullheight),

                ...List.generate(state.items.length, (index) {
                  final item = state.items[index];

                  return Padding(
                    padding: EdgeInsets.only(bottom:sizeheight* 16/fullheight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                fontSize:sizewidth* 16/fullwidth,
                    fontWeight: FontWeight.w400,
                    color: AppColors.txtPrimary
                              ),
                            ),
                            SizedBox(width: sizewidth*3/fullwidth,),
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size:sizewidth* 16/fullwidth,
                            ),
                          ],
                        ),
                        SizedBox(height:sizeheight* 4/fullheight),
                        Text('Menu Penunjang: ${item.menu}', style: TextStyle(color: AppColors.txtPrimary),),

                        SizedBox(height:sizeheight* 8/fullheight),

                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(sizewidth* 8/fullwidth),
                                child: LinearProgressIndicator(
                                  value: item.percentage,
                                  minHeight: 10,
                                  backgroundColor: Colors.grey.shade400,
                                  valueColor:
                                      AlwaysStoppedAnimation(item.barColor),
                                ),
                              ),
                            ),
                            SizedBox(width:sizewidth* 12/fullwidth),
                            Text(
                              '${(item.percentage * 100).toInt()}%',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.txtPrimary
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
