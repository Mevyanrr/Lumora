import 'package:bloc/bloc.dart';
import 'package:lumora/features/auth/presentation/bloc/auth_event.dart';
import 'package:lumora/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      
      await Future.delayed(const Duration(seconds: 2));

      emit(state.copyWith(status: AuthStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    //kecocokan pass dan konfirm pass -> memvalidasi
    if (event.password != event.konfirmPassword) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: 'Password dan konfirmasi password tidak sama',
        ),
      );
      return;
    }

    try {
      await Future.delayed(const Duration(seconds: 2));

      emit(state.copyWith(status: AuthStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
