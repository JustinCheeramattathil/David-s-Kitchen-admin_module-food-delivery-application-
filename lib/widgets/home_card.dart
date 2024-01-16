import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCard extends StatelessWidget {
  final String text;
  const HomeCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 100,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 250, 114, 3),
          Color.fromARGB(255, 255, 187, 85),
        ]),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            Text(
              'Management',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
