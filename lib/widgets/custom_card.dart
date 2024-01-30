import 'package:adminmodule/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class CustomCard extends StatelessWidget {
  final String text;

  final String imageUrl;
  const CustomCard({
    super.key,
    required this.text,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 280,
      width: 100,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 250, 114, 3),
          Color.fromARGB(255, 255, 187, 85),
        ]),
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            kheight20,
            Container(
              height: size.height * 0.1,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: const Color.fromARGB(255, 250, 114, 3),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
