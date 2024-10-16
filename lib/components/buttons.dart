import 'package:flutter/material.dart';
import 'package:project_gauss/components/neu_box.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NeuBox(
        child: GestureDetector(
          onTap: buttonPressed,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color,
            ),
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
