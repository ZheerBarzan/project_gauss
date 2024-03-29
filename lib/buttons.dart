import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonPressed;

  Buttons(
      {this.color,
      required this.buttonText,
      this.textColor,
      this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonPressed,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
