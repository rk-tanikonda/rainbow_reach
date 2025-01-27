import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF000000); // Black
  static const secondary = Color(0xFFFFFFFF); // White
  static const error = Color(0xFFDB4437); // Red
  static const grey = Color(0xFF757575); // Grey
  static const lightGrey = Color(0xFFF2F2F2); // Light Grey
  static const offWhite = Color(0xFFF8F8F8); // Off White
}

class AppTextStyles {
  static const title = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const subtitle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static const body = TextStyle(fontSize: 14, color: AppColors.grey);
}
