import 'package:flutter/material.dart';
import 'package:lumora/features/auth/presentation/pages/login_view.dart';
import 'package:lumora/features/auth/presentation/pages/regist_view.dart';

class Regist extends StatelessWidget {
  Regist({super.key});

  final TextEditingController _namauserController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _pwController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RegistView(
      namauserController: _namauserController,
      emailController: _emailController,
      pwController: _pwController,
    );
  }
}