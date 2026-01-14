import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

enum CustomFieldType { text, number, email, password, date }

class CustomTxtField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final CustomFieldType fieldType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  final ValueChanged<String>? onChanged;
  final ValueChanged<DateTime>? onDateSelected;

  const CustomTxtField({
    super.key,
    required this.labelText,
    required this.controller,
    this.fieldType = CustomFieldType.text,
    this.suffixIcon,
    this.onChanged,
    this.onDateSelected,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: fieldType == CustomFieldType.date,
      keyboardType: _getKeyboardType(fieldType),
      onChanged: fieldType == CustomFieldType.text ? onChanged : null,
      onTap: fieldType == CustomFieldType.date
          ? () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(
                  const Duration(days: 365 * 2),
                ),
                lastDate: DateTime.now(),
              );
    
              if (pickedDate != null) {
                controller.text =
                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                onDateSelected?.call(pickedDate);
              }
            }
          : null,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: sizewidth * 14 / fullwidth,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: AppColors.txtPrimary,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.primaryOrange,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

TextInputType _getKeyboardType(CustomFieldType type) {
  switch (type) {
    case CustomFieldType.number:
      return TextInputType.number;
    case CustomFieldType.email:
      return TextInputType.emailAddress;
    case CustomFieldType.password:
      return TextInputType.visiblePassword;
    case CustomFieldType.text:
      return TextInputType.text;
    case CustomFieldType.date:
      return TextInputType.none;
  }
}