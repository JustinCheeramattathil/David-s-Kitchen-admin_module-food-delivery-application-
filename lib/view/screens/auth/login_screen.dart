// ignore_for_file: use_build_context_synchronously
import 'package:adminmodule/controller/admin_login_controller.dart';
import 'package:adminmodule/core/constants/constants.dart';
import 'package:adminmodule/widgets/custom_login_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../widgets/custom_login_textfield.dart';

class LoginScreen extends StatelessWidget {
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 230, 211, 182),
                Colors.white,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                kheight50,
                Container(
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/davis.jpeg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                kheight60,
                Shimmer.fromColors(
                  baseColor: const Color.fromARGB(255, 250, 114, 3),
                  highlightColor: Colors.black,
                  child: Text(
                    'David\'s Kitchen',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 35,
                      ),
                    ),
                  ),
                ),
                Text(
                  'delivering dangerously delicious baskets',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
                kheight40,
                CustomLoginTextField(
                  controller: mobileController,
                  hintText: 'Mobile',
                  obscureText: false,
                ),
                kheight25,
                CustomLoginTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: false,
                ),
                kheight50,
                Consumer<LoginController>(
                    builder: (context, loginController, child) {
                  return CustomLoginButton(onTap: () async {
                    await loginController.adminLogin(
                      mobileController.text,
                      passwordController.text,
                      context,
                    );
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
