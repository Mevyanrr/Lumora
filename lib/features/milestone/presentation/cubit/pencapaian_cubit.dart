import 'package:flutter_bloc/flutter_bloc.dart';

enum PencapaianStatus {
  dapat,
  belum,
   initial,
}

class PencapaianCubit extends Cubit<PencapaianStatus> {
  PencapaianCubit() : super(PencapaianStatus.initial);

  void pilihDapat() => emit(PencapaianStatus.dapat);

  void pilihBelum() => emit(PencapaianStatus.belum);
}
