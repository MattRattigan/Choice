import 'package:flutter/material.dart';
import 'package:no_name_app/widget/home/fortune_wheel.dart';
import 'package:no_name_app/widget/nav/navi.dart';

class WheelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var randomWheel = RandomWheel().build(context);
    NaviBar navi = NaviBar();
    return Scaffold(
      bottomNavigationBar: navi.customGnav(context: context),
      appBar: AppBar(
        title: Text('Question Screen'),
      ),
      body: Center(child: randomWheel),
    );
  }
}