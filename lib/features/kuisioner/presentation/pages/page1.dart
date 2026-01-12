import 'package:flutter/material.dart';
import 'package:lumora/features/kuisioner/presentation/pages/page1_view.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Page1View(
      nameController: _nameController,
      dateController: _dateController,
    );
  }
}

