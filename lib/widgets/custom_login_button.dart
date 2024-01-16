import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/home');
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 250, 114, 3),
              Color.fromARGB(255, 255, 187, 85),
            ]),
            borderRadius: BorderRadius.circular(40)),
        child: Center(
          child: Text(
            'Sign In',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
