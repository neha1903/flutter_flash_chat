import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function onChange;
  final String hintText;
  final Color hintTextColor;
  final Color textColor;
  final Color borderColor;

  CustomTextField({
    required this.onChange,
    required this.hintText,
    required this.hintTextColor,
    required this.textColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        onChange(value);
      },
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintTextColor,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
