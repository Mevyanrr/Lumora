import 'package:flutter/material.dart';
import 'package:lumora/features/auth/presentation/pages/login_view.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController _namauserController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _pwController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LoginView(
      namauserController: _namauserController,
      emailController: _emailController,
      pwController: _pwController,
    );
  }
}