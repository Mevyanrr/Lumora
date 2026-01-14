import 'package:flutter/material.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page4_view.dart';

class Page4 extends StatelessWidget {
  Page4({super.key});

  final TextEditingController _aktivitasBayiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Page4View(
      aktivitasBayiController: _aktivitasBayiController,
    );
  }
}