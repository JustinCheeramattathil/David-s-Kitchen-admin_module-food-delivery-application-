import 'package:adminmodule/widgets/custom_login_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class UpdateCategory extends StatelessWidget {
  final categoryController = TextEditingController();
  UpdateCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 209, 152),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 209, 152),
        title: Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 250, 114, 3),
          highlightColor: Colors.white,
          child: Text(
            'Update Category',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  color: const Color.fromARGB(255, 255, 153, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Edit Image',
                    style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomLoginTextField(
              controller: categoryController,
              hintText: 'Edit category name',
              obscureText: false,
            ),
            SizedBox(
              height: size.height * 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 120,
                    child: MaterialButton(
                      onPressed: () {},
                      color: const Color.fromARGB(255, 255, 153, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Delete',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 120,
                    child: MaterialButton(
                      onPressed: () {},
                      color: const Color.fromARGB(255, 255, 153, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Update',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
