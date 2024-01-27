import 'dart:math';
import 'package:flutter/material.dart' show FontWeight, Colors;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardController extends GetxController {
  final Random random = Random();

  final titleTextStyle = GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);
  final monthTextStyle = GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white);
  final progressTextStyle = GoogleFonts.poppins(
      fontSize: 40, color: Colors.white, fontWeight: FontWeight.w600);
}
