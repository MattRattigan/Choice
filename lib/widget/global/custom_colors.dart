import 'package:flutter/material.dart';

class CustomColors {
  static const LinearGradient linearGradient = LinearGradient(
      colors: [Colors.red, Colors.orange],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft);

  static const boxDecoration = BoxDecoration(gradient: linearGradient);
}
