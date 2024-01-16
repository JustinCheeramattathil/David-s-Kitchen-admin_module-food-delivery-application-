import 'package:adminmodule/widgets/splash_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color.fromARGB(255, 29, 28, 28),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Text(
                  'David\'s Kitchen',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 35,
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
                  height: 300,
                ),
                Text(
                  'Welcome to David\'s Kitchen',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const SplashButton(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
