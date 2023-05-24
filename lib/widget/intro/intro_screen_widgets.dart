import 'package:flutter/material.dart';

class IntroWidgets {
  BoxDecoration get boxDecorationIntro => _introScreenDecoration();
  double opacity1 = 1.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  double opacity4 = 0.0;
  String finalText = "";

  BoxDecoration _introScreenDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(-0.21101152896881104, 1.054484248161316),
        end: Alignment(-1.054484248161316, -0.9917454719543457),
        colors: [
          Color.fromRGBO(237, 86, 86, 1),
          Color.fromRGBO(237, 86, 86, 1),
          Color.fromRGBO(237, 167, 86, 1)
        ],
      ),
    );
  }
}
