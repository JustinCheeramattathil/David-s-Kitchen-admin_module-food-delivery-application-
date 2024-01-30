import 'package:adminmodule/view/screens/home/category/category_screen.dart';
import 'package:adminmodule/view/screens/home/offer_screen.dart';
import 'package:adminmodule/view/screens/home/order_screen.dart';
import 'package:adminmodule/view/screens/home/product/product_screen.dart';
import 'package:adminmodule/view/screens/home/rider_screen.dart';
import 'package:adminmodule/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import 'user_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<Widget> widgets = [
    CategoryScreen(),
    ProductScreen(),
    const OrderScreen(),
    const OfferScreen(),
    const UserScreen(),
    const RiderScreen(),
  ];
 
  List<String> texts = [
    'Category',
    'Product',
    'Order',
    'Offer',
    'User',
    'Rider',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 250, 114, 3),
          highlightColor: Colors.white,
          child: Text(
            'Management',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 10,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => widgets[index],
                  ),
                );
              },
             
              child: HomeCard(
                text: texts[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
