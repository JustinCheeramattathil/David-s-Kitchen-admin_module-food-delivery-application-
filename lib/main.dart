import 'package:adminmodule/controller/admin_login_controller.dart';
import 'package:adminmodule/controller/category_controller.dart';
import 'package:adminmodule/repository/admin_login_repository.dart';
import 'package:adminmodule/repository/category_repository.dart';
import 'package:adminmodule/view/screens/auth/login_screen.dart';
import 'package:adminmodule/view/screens/home/home_screen.dart';
import 'package:adminmodule/view/screens/home/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(
            create: (_) => LoginController(LoginRepository(Dio()))),
        ChangeNotifierProvider<CategoryController>(
            create: (_) => CategoryController(CategoryRepository(Dio()))),
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food delivery app admin module',
        home: const SplashScreen(),
        routes: {
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
