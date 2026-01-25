import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileMenuTapped>((event, emit) {
      switch (event.index) {
        case 0:
         emit(NavigateToProfile());
          break;
        case 1:
          emit(NavigateToSetting());
          break;
        case 2:
          // navigate to Notifikasi
          break;
        case 3:
          // navigate to Kontak
          break;
        case 4:
          // navigate to Premium
          break;
        case 5:
          emit(Leave());
          break;
      }
    });
  }
}
