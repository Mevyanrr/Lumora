import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/features/stimulasi/data/models/stimulate_date.dart';
import 'package:lumora/features/stimulasi/services/stimulasi_service.dart';
import 'countdown_event.dart';
import 'countdown_state.dart';

class CountdownBloc extends Bloc<CountdownEvent, CountdownState> {
  Timer? _timer;
  final StimulasiService stimulate;
  StreamSubscription? dateStream;

  CountdownBloc(this.stimulate)
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
    on<TargetDataChanged>(_onDataChanged);
    on<UpdateStimulationStatus>(_onUpdateStatus);
    _initStream();
  }

  Future<void> _onUpdateStatus(
      UpdateStimulationStatus event, Emitter<CountdownState> emit) async {
    try {
      if (event.isCompleted == true) {
        final now = DateTime.now();
        // Hari terakhir bulan depan
        final lastDayOfNextMonth = DateTime(now.year, now.month + 2, 0);
        await stimulate
            .saveDate(StimulateDate(targetDate: lastDayOfNextMonth, isCompleted: false));
        add(StartCountdown(lastDayOfNextMonth));
      } else {
        final currentTarget = state.targetDate;
        await stimulate.saveDate(
            StimulateDate(targetDate: currentTarget, isCompleted: false));
      }
    } catch (e) {
      print("$e");
    }
  }

  void _initStream() {
    dateStream = stimulate.getDateFromFirestore().listen((data) async {
      if (data != null) {
        final now = DateTime.now();
        final target = data.targetDate;
        // Hari terakhir bulan ini (DateTime(year, month+1, 0) = hari terakhir bulan)
        final lastDayOfThisMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
        if (target.isBefore(now) ||
            (target.year == now.year &&
                target.month == now.month &&
                target.day == now.day)) {
          await stimulate.saveDate(
              StimulateDate(targetDate: lastDayOfThisMonth, isCompleted: false));
          add(StartCountdown(lastDayOfThisMonth));
        } else {
          add(TargetDataChanged(target));
        }
      } else {
        // Belum ada data di Firestore — set ke hari terakhir bulan ini
        final now = DateTime.now();
        final lastDayOfThisMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
        await stimulate.saveDate(
            StimulateDate(targetDate: lastDayOfThisMonth, isCompleted: false));
        add(StartCountdown(lastDayOfThisMonth));
      }
    });
  }

  Future<void> _onSaveDate(
      SaveTargetDate event, Emitter<CountdownState> emit) async {
    try {
      final dataToSave =
          StimulateDate(targetDate: event.newDate, isCompleted: false);
      if (dataToSave.isCompleted == true) {
        final now = DateTime.now();
        await stimulate.saveDate(StimulateDate(
            targetDate: DateTime(now.year, now.month + 1, now.day),
            isCompleted: false));
      } else {
        return;
      }
      add(StartCountdown(event.newDate));
    } catch (e) {
      print("$e");
    }
  }

  void _onDataChanged(TargetDataChanged event, Emitter<CountdownState> emit) {
    if (event != null) {
      add(StartCountdown(event.date!));
    }
  }

  void _onStart(StartCountdown event, Emitter<CountdownState> emit) {
    _timer?.cancel();

    emit(_calculateState(event.targetDate));

    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => add(TickCountdown()),
    );
  }

  void _onTick(TickCountdown event, Emitter<CountdownState> emit) {
    emit(_calculateState(state.targetDate));
  }

  CountdownState _calculateState(DateTime target) {
    final now = DateTime.now();
    //final DateTime target = DateTime(now.day + 7, now.month, now.year);
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
    dateStream?.cancel();
    return super.close();
  }
}
