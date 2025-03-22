import 'package:bokiaaa/customs/custom_button.dart';
import 'package:bokiaaa/customs/maintext.dart';
import 'package:bokiaaa/customs/navigate.dart';
import 'package:bokiaaa/pages/login/login.dart';
import 'package:flutter/material.dart';

import '../login/register.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/image/alif-caesar-rizqi-pratama-loUlSOXL81c-unsplash 1.png",
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/image/Group 2918.png"),
              const SizedBox(
                height: 20,
              ),
              Maintext(text: 'Order Your Book Now!'),
              const SizedBox(
                height: 200,
              ),
              CustomButton(
                text: "Login",
                function: () {
                  Navigate(
                    context,
                    LoginPage(),
                  );
                },
                width: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "Register",
                function: () {
                  Navigate(
                    context,
                    const RegisterPage(),
                  );
                },
                color: Colors.white,
                width: 300,
                textColor: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
