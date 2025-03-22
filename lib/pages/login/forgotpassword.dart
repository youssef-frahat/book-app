import 'package:bokiaaa/customs/navigate.dart';
import 'package:flutter/material.dart';

import '../../customs/custom_button.dart';
import '../../customs/custom_textfaild.dart';
import '../../customs/maintext.dart';
import 'login.dart';
import 'otppage.dart';

class ForgotpasswordPage extends StatelessWidget {
  const ForgotpasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Maintext(text: "Forgot Password?"),
                const SizedBox(height: 10),
                const Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hint: "Enter your email",
                  controller: TextEditingController(),
                  iconData: Icons.mail,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Send Code",
                  function: Navigate(
                    context,
                    const OTPPage(),
                  ),
                  width: double.infinity,
                  height: 50,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Remember Password?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push((context),
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
