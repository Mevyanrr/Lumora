import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/core/theme/colors.dart';
import 'package:lumora/features/home/data/models/analisisresult_item.dart';
import 'package:lumora/features/home/presentation/bloc/analisisresult_event.dart';
import 'package:lumora/features/home/presentation/bloc/analisisresult_state.dart';

class AnalisisresultBloc extends Bloc<AnalisisresultEvent, AnalisisresultState> {
  AnalisisresultBloc() : super(AnalisisresultInitial()) {
    on<LoadAnalisisresult>((event, emit) {
      emit(
        AnalisisresultLoaded([
          AnalisisresultItem(
            title: 'Karbohidrat',
            menu: 'Kentang lunak',
            percentage: 0.9,
            barColor: AppColors.green,
          ),
          AnalisisresultItem(
            title: 'Protein',
            menu: 'Telur',
            percentage: 0.49,
            barColor: AppColors.secondary,
          ),
          AnalisisresultItem(
            title: 'Vitamin',
            menu: 'Pisang',
            percentage: 0.95,
            barColor: AppColors.yellowSemantic,
          ),
          AnalisisresultItem(
            title: 'Cairan',
            menu: 'Air putih',
            percentage: 1.0,
            barColor: AppColors.primaryBlue,
          ),
        ]),
      );
    });

    on<UpdatePersentase>((event, emit) {
      if (state is AnalisisresultLoaded) {
        final current = (state as AnalisisresultLoaded).items;
        final updated = List<AnalisisresultItem>.from(current);

        updated[event.index] = AnalisisresultItem(
          title: current[event.index].title,
          menu: current[event.index].menu,
          percentage: event.value,
          barColor: current[event.index].barColor,
        );

        emit(AnalisisresultLoaded(updated));
      }
    });
  }
}
