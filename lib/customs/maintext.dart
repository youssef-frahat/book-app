import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Maintext extends StatelessWidget {
  String text;
  Maintext({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 30),
    );
  }
}
