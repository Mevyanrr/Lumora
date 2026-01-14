import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

<<<<<<< HEAD
enum CustomFieldType {
  text,
  number,
  email,
  password,
  date,
}

=======
enum CustomFieldType { text, number, email, password, date }
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0

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
<<<<<<< HEAD
=======
    final size = MediaQuery.of(context).size;
    final sizewidth = size.width;
    final sizeheight = size.height;
    final fullheight = 917;
    final fullwidth = 412;
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: fieldType == CustomFieldType.date,
<<<<<<< HEAD
        keyboardType: _getKeyboardType(fieldType),
      onChanged: onChanged,
=======
      keyboardType: _getKeyboardType(fieldType),
      onChanged: fieldType == CustomFieldType.text ? onChanged : null,
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
      onTap: fieldType == CustomFieldType.date
          ? () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
<<<<<<< HEAD
                firstDate:
                    DateTime.now().subtract(const Duration(days: 365 * 2)),
                lastDate: DateTime.now(),
              );

=======
                firstDate: DateTime.now().subtract(
                  const Duration(days: 365 * 2),
                ),
                lastDate: DateTime.now(),
              );
    
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
              if (pickedDate != null) {
                controller.text =
                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                onDateSelected?.call(pickedDate);
              }
            }
          : null,
      decoration: InputDecoration(
        labelText: labelText,
<<<<<<< HEAD
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: TextStyle(color: AppColors.txtPrimary),
=======
        labelStyle: TextStyle(
          fontSize: sizewidth * 14 / fullwidth,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: AppColors.txtPrimary,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
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
<<<<<<< HEAD
}

=======
}
>>>>>>> a36d1a057ed236f496f2aca562faae29898a07a0
