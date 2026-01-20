import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/features/home/data/models/tipsgizi_item.dart';
import 'package:lumora/features/home/presentation/bloc/tipsgizi_event.dart';
import 'package:lumora/features/home/presentation/bloc/tipsgizi_state.dart';

class TipsGiziBloc extends Bloc<TipsGiziEvent, TipsGiziState> {
  TipsGiziBloc() : super(TipsGiziInitial()) {
    on<LoadTipsGizi>((event, emit) {
      emit(
        TipsGiziLoaded(
          [
            TipsGiziItem(
              text: "Selalu lengkapi 4 komponen karbohidrat, protein, lemak, dan vitamin",
            ),
            TipsGiziItem(
              text: "Sebaiknya tidak memberikan gula dan garam kepada si kecil",
            ),
            TipsGiziItem(
              text: "Pola dan jam makan harus teratur",
            ),
            TipsGiziItem(
              text: "Cukupi cairan terutama ASI dan air putih",
            ),
           
          ],
        ),
      );
    });
  }
}
