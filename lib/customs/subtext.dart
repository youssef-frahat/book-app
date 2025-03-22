import 'package:flutter/material.dart';

class Subtext extends StatelessWidget {
  Text text;
  Subtext({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text" as String,
      style: const TextStyle(
          color: Color.fromARGB(188, 0, 0, 0),
          fontWeight: FontWeight.w400,
          fontSize: 16),
    );
  }
}
