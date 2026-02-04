
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

  Future<void> _onUpdateStatus(UpdateStimulationStatus event, Emitter<CountdownState> emit) async {
    try{
      if(event.isCompleted == true){
        final nextWeek = DateTime.now().add(const Duration(days: 7));
        await stimulate.saveDate(StimulateDate(targetDate: nextWeek, isCompleted: false));
        add(StartCountdown(nextWeek));
      }  else {
        final currentTarget = state.targetDate;
        await stimulate.saveDate(StimulateDate(targetDate: currentTarget, isCompleted: false));
      }
    }catch(e){
      print("$e");
    }
  }

  void _initStream(){
    dateStream = stimulate.getDateFromFirestore().listen((data){
      if(data != null){
        add(TargetDataChanged(data.targetDate));
      }
    });
}


Future<void> _onSaveDate(
  SaveTargetDate event, Emitter<CountdownState> emit
  ) async {
    try{
    final dataToSave = StimulateDate(
      targetDate: event.newDate, isCompleted: false);
      if(dataToSave.isCompleted == true){
        await stimulate.saveDate(StimulateDate(targetDate: DateTime.now().add(const Duration(days: 7)), isCompleted: false));
      } else {
        return;
      }
      add(StartCountdown(event.newDate));
    } catch(e){
      print("$e");
    }
}

void _onDataChanged(TargetDataChanged event, Emitter<CountdownState> emit){
  if(event != null){
    add(StartCountdown(event.date!));
  }
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
    return super.close();
  }
}
