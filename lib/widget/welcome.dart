import 'package:flutter/material.dart';

class Welcome {
  static double increment = 0;
  static Widget buildText({
    required BuildContext context,
    // required double topFactor,
    required double opacity,
    required String text,
    double fontSize = 36,
    bool isBold = false,
    TextAlign textAlign = TextAlign.center,
    
  }) {
    // double deviceHeight = MediaQuery.of(context).size.height;

    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(seconds: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              text,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: fontSize,
                letterSpacing: 0,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                height: 1,
              ),
              textAlign: textAlign,
            ),
          ),
        ],
      ),
    );
  }

  Widget welcomeBox() {
    double sizedBoxHeight = 0.0;
    increment += 25.0;
    sizedBoxHeight = increment;
    
    return SizedBox(
      height: sizedBoxHeight,
    );
  }
}
