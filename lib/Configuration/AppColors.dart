import 'package:flutter/material.dart';

class AppColors{

  /// Background Color
  static const Color backgroundColor = Color(0xff2B547E);

  /// Primary Color
  static const Color primaryColor = Color(0xff95B9C7);

  /// Text Color
  static const Color textColor = Color(0xff01F9C6);


  /// Background Color with Day Mode (Gradient)
  static const LinearGradient nightModeBackgroundColor = LinearGradient(
    colors: [
      Color(0xFF141E30), // dark navy
      Color(0xFF243B55), // deep blue
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Primary Text Color with Day Mode
  static const Color dayModePrimaryTextColor = Colors.black87;
}