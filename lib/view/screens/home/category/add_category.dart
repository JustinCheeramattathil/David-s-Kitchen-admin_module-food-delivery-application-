import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 250, 114, 3),
          highlightColor: Colors.white,
          child: Text(
            'Add New Category',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 4),
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr3QxqTIyF9ZrWS99YdyZbxJL_WkYY_m1wZA'),
                      fit: BoxFit.cover)),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: const Color.fromARGB(255, 255, 153, 0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              'Add Image',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
