import 'package:flutter/material.dart';
import 'package:no_name_app/widget/nav/navi.dart';

class QuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     NaviBar navi = NaviBar();
    return Scaffold(
      bottomNavigationBar: navi.customGnav(context: context),
      appBar: AppBar(
        title: Text('Question Screen'),
      ),
      body: Center(
        child: Text('This is the Question Screen'),
      ),
    );
  }
}
