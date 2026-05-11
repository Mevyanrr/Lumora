import 'package:flutter/material.dart';
import 'package:lumora/core/theme/colors.dart';

enum CustomFieldType {
  text,
  number,
  email,
  password,
  date,
}

class CustomTxtField extends StatefulWidget {
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
  State<CustomTxtField> createState() => _CustomTxtFieldState();
}

class _CustomTxtFieldState extends State<CustomTxtField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.fieldType == CustomFieldType.password;

    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      readOnly: widget.fieldType == CustomFieldType.date,
      keyboardType: _getKeyboardType(widget.fieldType),
      obscureText: isPassword ? _obscureText : false,
      onChanged: widget.onChanged,
      onTap: widget.fieldType == CustomFieldType.date
          ? () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(const Duration(days: 365 * 2)),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                widget.controller.text =
                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                widget.onDateSelected?.call(pickedDate);
              }
            }
          : null,
      decoration: InputDecoration(
        labelText: widget.labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: TextStyle(color: AppColors.txtPrimary),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.txtPrimary,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
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

