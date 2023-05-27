import 'package:flutter/material.dart';
import 'package:no_name_app/widget/nav/navi.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NaviBar navi = NaviBar();
    return Scaffold(
      bottomNavigationBar: navi.customGnav(context: context),
      appBar: AppBar(
        title: Text('The Settings Screen'),
      ),
      body: Center(
          child: SvgPicture.asset('assets/images/login_card.svg',
              semanticsLabel: 'login_card')),
    );
  }
}
