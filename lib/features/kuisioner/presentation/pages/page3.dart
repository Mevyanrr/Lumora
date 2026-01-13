import 'package:flutter/material.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page3_view.dart';

class Page3 extends StatelessWidget {
  Page3({super.key});

  final TextEditingController _kondisiBayiController = TextEditingController();
  final TextEditingController _pilKontrolController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Page3View(
      kondisiBayiController: _kondisiBayiController,
      pilKontrolController: _pilKontrolController,
    );
  }
}