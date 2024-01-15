import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_login_textfield.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 252, 230, 197),
                Colors.white,
              ],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Text(
                'Verrot',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
              Text(
                'delivering dangerously delicious baskets',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomLoginTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomLoginTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
