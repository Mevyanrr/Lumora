import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lumora/core/theme/colors.dart';

enum CustomFieldType {
  text,
  number,
  date,
}


class CustomTxtField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final CustomFieldType fieldType;
  final Widget? suffixIcon;

  const CustomTxtField({
    super.key,
    required this.labelText,
    required this.controller,
    this.fieldType = CustomFieldType.text,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: fieldType == CustomFieldType.date,
      keyboardType: _keyboardType(),
      inputFormatters: _inputFormatters(),
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: TextStyle(color: AppColors.txtPrimary),
        suffixIcon: _buildSuffixIcon(context),
        filled: true, 
        fillColor: AppColors.primaryOrange,
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none
        ),
      ),
    );
  }


  TextInputType _keyboardType() {
    switch (fieldType) {
      case CustomFieldType.number:
        return TextInputType.number;
      case CustomFieldType.date:
        return TextInputType.datetime;
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter>? _inputFormatters() {
    if (fieldType == CustomFieldType.number) {
      return [FilteringTextInputFormatter.digitsOnly];
    }
    return null;
  }

  Widget? _buildSuffixIcon(BuildContext context) {
    if (fieldType == CustomFieldType.date) {
      return IconButton(
        icon: const Icon(Icons.calendar_month_rounded),
        onPressed: () => _selectDate(context),
      );
    }
    return suffixIcon;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }
}


