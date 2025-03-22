import 'package:bokiaaa/customs/navigate.dart';
import 'package:bokiaaa/customs/subtext.dart';
import 'package:flutter/material.dart';

import '../../customs/custom_button.dart';
import '../../customs/maintext.dart';
import 'home_screen.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Maintext(text: "SUCCESS!"),
                ),
                const SizedBox(height: 10),
                Subtext(
                  text: const Text(
                    "Your order will be delivered soon. Thank you for choosing our app!",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                CustomButton(
                  text: "Back To Home",
                  function: Navigate(context,const HomeScreen(),
                      ), // Replace with your home page widget
                  width: double.infinity,
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
