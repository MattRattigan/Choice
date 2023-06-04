import 'package:flutter/material.dart';
import 'package:no_name_app/pages/home_screen.dart';
import 'dart:async';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late double _deviceHeight, _deviceWidth;
  IntroWidgets introWidgets = IntroWidgets();

  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  void changeOpacity() {
    for (var i = 0; i <= 15; i+=2) {
  Timer(Duration(seconds: i), () {
    setState(() {
      switch (i) {
        case 2:
          introWidgets.opacity1 = 0.0;
          introWidgets.opacity2 = 1.0;
          break;
        case 4:
          introWidgets.opacity2 = 0.0;
          introWidgets.opacity3 = 1.0;
          break;
        case 6:
          introWidgets.opacity3 = 0.0;
          introWidgets.opacity4 = 1.0;
          break;
        case 8:
          introWidgets.finalText = "It's simple!";
          introWidgets.opacity3 = 0.0;
          introWidgets.opacity4 = 1.0;
          break;
        case 10:
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          );
          break;
      }
    });
  });
}

    
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          decoration: introWidgets.boxDecorationIntro,
          child: Stack(
            children: <Widget>[
              Welcome.buildText(
                context: context,
                text: 'Welcome\nTo\nChoice',
                opacity: introWidgets.opacity1,
                isBold: true,
              ),
              Welcome.buildText(
                context: context,
                text: 'Were we help you\n decide that hard\n question:',
                opacity: introWidgets.opacity2,
              ),
              Welcome.buildText(
                context: context,
                text: '\nWhat do I\n want to eat?',
                opacity: introWidgets.opacity3,
              ),
              Welcome.buildText(
                context: context,
                text: introWidgets.finalText,
                opacity: introWidgets.opacity4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


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
