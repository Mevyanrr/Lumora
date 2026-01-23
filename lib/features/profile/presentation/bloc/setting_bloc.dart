import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/features/profile/domain/models/setting_item.dart';
import 'package:lumora/features/profile/presentation/bloc/setting_event.dart';
import 'package:lumora/features/profile/presentation/bloc/setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingStateiInitial()) {
    on<LoadSetting>((event, emit) {
      emit(
        SettingLoaded([
          SettingItem(icon: 'assets/icons/baby.svg', title: "Bahasa"),
          SettingItem(icon: 'assets/icons/baby.svg', title: "Tampilan"),
          SettingItem(icon: 'assets/icons/baby.svg', title: "Perangkat"),
        ]),
      );
    });
  }
}
