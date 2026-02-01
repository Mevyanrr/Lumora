import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/features/milestone/data/models/month_range.dart';
import 'package:lumora/features/milestone/presentation/bloc/month_event.dart';
import 'package:lumora/features/milestone/presentation/bloc/month_state.dart';

class MonthBloc extends Bloc<MonthEvent, MonthState> {
  MonthBloc() : super(MonthLoading()) {
    on<LoadMonth>((event, emit) {
      final ages = [
        MonthRange(0, 2),
        MonthRange(3, 5),
        MonthRange(6, 8),
        MonthRange(9, 11),
        MonthRange(12, 14),
        MonthRange(15, 17),
        MonthRange(18, 20),
        MonthRange(21, 24),
      ];

      emit(MonthLoaded(
        currentMonth: event.currentMonth,
        ages: ages,
      ));
    });
  }
}
