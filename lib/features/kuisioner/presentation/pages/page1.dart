import 'package:flutter/material.dart';
import 'page1_view.dart';

class Page1 extends StatelessWidget {
  Page1({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Page1View(
      nameController: nameController,
      dateController: dateController,
    );
  }
}
