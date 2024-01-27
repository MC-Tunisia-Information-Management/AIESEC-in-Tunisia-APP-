import 'package:aiesec_core/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: const Color(0xFF037ef3),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            child: Image.asset('assets/loading.gif', height: 100, width: 100),
          ),
        ),
      ),
    );
  }
}
