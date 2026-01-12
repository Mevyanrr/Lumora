import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

enum CustomFieldType { text, date }

class CustomTxtField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final CustomFieldType fieldType;
  final Widget? suffixIcon;

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
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: fieldType == CustomFieldType.date,
      keyboardType:
          fieldType == CustomFieldType.text ? TextInputType.text : TextInputType.none,
      onChanged: fieldType == CustomFieldType.text ? onChanged : null,
      onTap: fieldType == CustomFieldType.date
          ? () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate:
                    DateTime.now().subtract(const Duration(days: 365 * 2)),
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
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: TextStyle(color: AppColors.txtPrimary),
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
