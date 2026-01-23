
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'countdown_event.dart';
import 'countdown_state.dart';

class CountdownBloc extends Bloc<CountdownEvent, CountdownState> {
  Timer? _timer;

  CountdownBloc()
      : super(
          CountdownState(
            days: 0,
            hours: 0,
            minutes: 0,
            targetDate: DateTime.now(),
          ),
        ) {
    on<StartCountdown>(_onStart);
    on<TickCountdown>(_onTick);
  }

  void _onStart(
      StartCountdown event, Emitter<CountdownState> emit) {
    _timer?.cancel();

    emit(_calculateState(event.targetDate));

    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => add(TickCountdown()),
    );
  }

  void _onTick(
      TickCountdown event, Emitter<CountdownState> emit) {
    emit(_calculateState(state.targetDate));
  }

  CountdownState _calculateState(DateTime target) {
    final now = DateTime.now();
    final diff = target.difference(now);

    if (diff.isNegative) {
      return CountdownState(
        days: 0,
        hours: 0,
        minutes: 0,
        targetDate: target,
      );
    }

    final days = diff.inDays;
    final hours = diff.inHours % 24;
    final minutes = diff.inMinutes % 60;

    return CountdownState(
      days: days,
      hours: hours,
      minutes: minutes,
      targetDate: target,
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
