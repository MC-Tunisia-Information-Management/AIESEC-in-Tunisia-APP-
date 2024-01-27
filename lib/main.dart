import 'package:aiesec_core/controllers/controller.dart';
import 'package:aiesec_core/screens/splash_screen.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: () {
        Get.put(Controller());
      },
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF037EF3),
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.poppins(),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
