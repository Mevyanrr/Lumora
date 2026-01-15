import 'package:flutter/material.dart';
import 'package:lumora/features/home/presentation/pages/data_bayi_view.dart';

class DataBayi extends StatelessWidget {
   DataBayi({super.key});
final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _bbController = TextEditingController();
  final TextEditingController _tbController= TextEditingController();
  final TextEditingController _lingkarKepalaController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DataBayiView(
      nameController: _nameController,
      dateController: _dateController,
      bbController: _bbController,
      tbController: _tbController,
      lingkarKepalaController: _lingkarKepalaController,
    );
  }
}

