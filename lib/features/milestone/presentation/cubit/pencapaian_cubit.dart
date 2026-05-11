import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/features/stimulasi/data/models/aktivitas.dart';

enum PencapaianStatus {
  dapat,
  belum,
  initial,
}

class PencapaianState {
  final PencapaianStatus status;
  final Aktivitas? aktivitas;

  PencapaianState({required this.status, this.aktivitas});
}

class PencapaianCubit extends Cubit<PencapaianState> {
  PencapaianCubit(Aktivitas aktivitas)
      : super(PencapaianState(
          status: aktivitas.isCompleted
              ? PencapaianStatus.dapat
              : PencapaianStatus.initial,
          aktivitas: aktivitas,
        ));

  void pilihDapat() => emit(PencapaianState(
        status: PencapaianStatus.dapat,
        aktivitas: state.aktivitas,
      ));

  void pilihBelum() => emit(PencapaianState(
        status: PencapaianStatus.belum,
        aktivitas: state.aktivitas,
      ));
}
