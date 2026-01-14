import 'package:flutter/material.dart';
import 'page1_view.dart';

class Page1 extends StatelessWidget {
  Page1({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Page1View(
      nameController: _nameController,
      dateController: _dateController,
    );
  }
}
