import 'package:adminmodule/view/login_screen.dart';
import 'package:adminmodule/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food delivery app admin module',
      home: const SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
