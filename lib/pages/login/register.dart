import 'package:bokiaaa/customs/custom_button.dart';
import 'package:bokiaaa/customs/navigate.dart';
import 'package:flutter/material.dart';
import '../../customs/custom_textfaild.dart';
import 'login.dart';
import '../../customs/maintext.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Maintext(text: "Hello! Register to get started"),
                const SizedBox(height: 20),
                CustomTextField(
                  hint: "Username",
                  controller: usernameController,
                  iconData: Icons.person,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hint: "Email",
                  controller: emailController,
                  iconData: Icons.mail,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hint: "Password",
                  controller: passwordController,
                  isPassword: true,
                  iconData: Icons.lock,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hint: "Confirm password",
                  controller: confirmPasswordController,
                  isPassword: true,
                  iconData: Icons.lock,
                ),
                const SizedBox(height: 20),
                CustomButton(
                    text: "Rigester", function: Navigate(context, LoginPage())),
                const SizedBox(height: 20),
                const Center(child: Text("Or Register with")),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mail),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.apple),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }),
                        );
                      },
                      child: const Text("Login Now"),
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
