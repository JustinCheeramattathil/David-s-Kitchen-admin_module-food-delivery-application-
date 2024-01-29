import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:adminmodule/controller/category_controller.dart';
import 'package:adminmodule/model/category_model.dart';
import 'package:adminmodule/widgets/custom_login_textfield.dart';

class AddCategory extends StatelessWidget {
  final categoryController = TextEditingController();
  AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final category = Provider.of<CategoryController>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 209, 152),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 209, 152),
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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      image: DecorationImage(
                        image: category.image != null
                            ? FileImage(category.image!)
                            : const AssetImage('assets/images/blank.png')
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () async {
                        await category.pickImage();
                      },
                      color: const Color.fromARGB(255, 255, 153, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Add Image',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomLoginTextField(
                  controller: categoryController,
                  hintText: 'Add category name',
                  obscureText: false,
                ),
                SizedBox(
                  height: size.height * 0.3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () async {
                        if (categoryController.text.isNotEmpty &&
                            category.image != null) {
                          CategoryModel categoryModel = CategoryModel(
                            id: '',
                            name: categoryController.text,
                            image: ImageCategory(
                              publicId: '',
                              imagepath: category.image!.path,
                            ),
                            isBlocked: true,
                          );

                          await category.addCategory(categoryModel, context);
                          categoryController.clear();
                          category.setImage(null);
                        }
                      },
                      color: const Color.fromARGB(255, 255, 153, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Save the details',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (category.isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 255, 153, 0),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
