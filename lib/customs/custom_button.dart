// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  dynamic function;
  final Color color;
  final double width;
  final double height;
  final Color textColor;

  CustomButton(
      {super.key,
      required this.text,
      required this.function,
      this.color = const Color.fromARGB(255, 160, 83, 1),
      this.width = 200.0,
      this.height = 50.0,
      this.textColor = const Color.fromARGB(250, 250, 250, 250)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: function,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
