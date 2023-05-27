import 'package:flutter/material.dart';
import 'package:no_name_app/widget/frosted_glass.dart';
import 'package:no_name_app/widget/app_bar.dart';

class LoginScreen extends StatelessWidget {
  final double? _deviceHeight, _deviceWidth;
  const LoginScreen(
      {Key? key, required double deviceHeight, required double deviceWidth})
      : _deviceHeight = deviceHeight,
        _deviceWidth = deviceWidth,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: FrostedGlassBox(
          boxWidth: 200.0,
          boxHeight: 200.0,
          boxChild: Text(
            "hello world",
            style: TextStyle(color: Colors.white54, fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
