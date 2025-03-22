import 'package:flutter/material.dart';

class OTPInputBox extends StatelessWidget {
  const OTPInputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
      ),
    );
  }
}