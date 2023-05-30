import 'package:flutter/material.dart';
import 'package:no_name_app/pages/home_screen.dart';
import 'package:no_name_app/widget/intro/intro_screen_widgets.dart';
import 'package:no_name_app/widget/welcome.dart';
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