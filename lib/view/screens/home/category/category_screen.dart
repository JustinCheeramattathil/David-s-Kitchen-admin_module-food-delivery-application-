
import 'package:adminmodule/controller/category_controller.dart';
import 'package:adminmodule/model/category_model.dart';
import 'package:adminmodule/view/screens/home/category/add_category.dart';
import 'package:adminmodule/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 250, 114, 3),
          highlightColor: Colors.white,
          child: Text(
            'Categories',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<CategoryController>(context, listen: false)
            .getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color.fromARGB(255, 250, 114, 3),
            )); // You need to create a ShimmerGridView widget
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading categories'));
          } else {
            List<CategoryModel> categories = snapshot.data!;
            return GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                CategoryModel category = categories[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10,
                    bottom: 10,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/update_category');
                    },
                    child: CustomCard(
                      imageUrl: category.image.imagepath,
                      text: category.name,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 250, 114, 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddCategory(),
        )),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
