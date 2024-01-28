import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCards extends StatelessWidget {
  final String text;
  final String price;
  final String imageUrl;
  const ProductCards({
    super.key,
    required this.text,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 3),
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            Text(
              price,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
