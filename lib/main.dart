import 'package:bokiaaa/cubit/auth_cupit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/splash/spalsh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCupit(),
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
