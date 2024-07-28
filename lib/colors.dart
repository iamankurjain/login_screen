import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFFE5152);
  static const Color secondaryColor = Colors.purple;
  static const Color unselectedColor = Colors.grey;
  static const Color borderColor = Colors.blue;
  static const Color selectedTextColor = Colors.white;
  static const Color unselectedTextColor = Colors.black;

  static const Gradient selectedGradient = LinearGradient(
    colors: [primaryColor, secondaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}