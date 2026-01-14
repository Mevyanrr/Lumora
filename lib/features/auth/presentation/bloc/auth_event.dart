

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends AuthEvent {
  final String nama;
  final String email;
  final String password;

  const LoginSubmitted({
    required this.nama,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [nama, email, password];
}

class RegisterSubmitted extends AuthEvent {
  final String nama;
  final String email;
  final String password;
  final String konfirmPassword;

  const RegisterSubmitted({
    required this.nama,
    required this.email,
    required this.password,
    required this.konfirmPassword,
  });

  @override
  List<Object?> get props =>
      [nama, email, password, konfirmPassword];
}
