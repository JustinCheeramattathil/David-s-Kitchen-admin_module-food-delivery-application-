import 'package:adminmodule/controller/category_controller.dart';
import 'package:adminmodule/model/category_model.dart';
import 'package:adminmodule/view/screens/home/category/add_category.dart';
import 'package:adminmodule/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  // List<String> images = [
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr3QxqTIyF9ZrWS99YdyZbxJL_WkYY_m1wZA',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpxRmbxmp6T70o_34hmNpvqzK0Fry6vfGIBA',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTj3R8ENJIsPUvUp9oNOgdayXiAY2A1ZNZ4bg',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiITYoYPTsaAzC9nfxi8uUjd9I0EWHpjDOvg',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf0tAPwFcBAyejibkZwZD_TCrTztqYUyXaEQ',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiL1zd9TSmEMyTqPOrGMZkeXUIVd1cK6dHEA',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHshYfH0ct1580URgZctv7iamqHfBSuzP7Jg'
  // ];
  // List<String> title = [
  //   'Burger',
  //   'Pizza',
  //   'Juice',
  //   'IceCream',
  //   'Cake',
  //   'Coffe',
  //   'Shake',
  // ];

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
      body: Consumer<CategoryController>(
        builder: (context, categoryList, child) {
          List<CategoryModel> categories = categoryList.categories;
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
                child: CustomCard(
                  imageUrl: category.image.imagepath,
                  text: category.name,
                ),
              );
            },
          );
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
