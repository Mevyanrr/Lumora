import 'package:flutter/material.dart';

class ButtonSmall extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback onTap;
  final double radius;
  final Color txColor;

  const ButtonSmall({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.borderColor,
    required this.onTap,
    required this.radius,
    required this.txColor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: borderColor),
            ),
            alignment: Alignment.center,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: txColor,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
