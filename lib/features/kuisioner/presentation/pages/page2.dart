import 'package:flutter/material.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page2_view.dart';

class Page2 extends StatelessWidget {
  Page2({super.key});

  final TextEditingController _bbController = TextEditingController();
  final TextEditingController _tbController = TextEditingController();
  final TextEditingController _lingkarKepalaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Page2View(
      bbController: _bbController,
      tbController: _tbController,
      lingkarKepalaController: _lingkarKepalaController,
    );
  }
}