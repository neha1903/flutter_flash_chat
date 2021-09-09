import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPress;
  final Color color;
  final String label;

  CustomButton({
    required this.label,
    required this.color,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: color,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: () {
          onPress();
        },
        minWidth: 200.0,
        height: 42.0,
        child: Text(label),
      ),
    );
  }
}
