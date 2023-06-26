import 'package:flutter/material.dart';
import 'package:no_name_app/widget/global/base.dart';
import 'package:no_name_app/widget/nav/navi.dart';
import 'dart:async';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class WheelScreen extends StatefulWidget {
  WheelScreen({Key? key}) : super(key: key);

  @override
  _WheelScreenState createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen> {

  @override
  Widget build(BuildContext context) {
    var randomWheel = RandomWheel().build(context);
    return BasePage(
      bottomNavigationBar: NaviBar(),
      body: Container(child: Center(child: randomWheel), color: Colors.white,),
    );
  }
}

class Wheel {
  Wheel._();

  static const String _fontFamily = 'wheel';

  static const IconData wheel_lucky_game_svgrepo_com =
      IconData(0xe900, fontFamily: _fontFamily);
}

class RandomWheel {
  final StreamController<int> controller = StreamController<int>();

  RandomWheel({Key? key});

  Widget build(BuildContext context) {
    var randomItems = generateRandomItems(); // Method to generate random items

    return FortuneWheel(
      physics: CircularPanPhysics(
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
      ),
      onFling: () {
        controller.add(1);
      },
      selected: controller.stream,
      items: randomItems,
    );
  }

  List<FortuneItem> generateRandomItems() {
    // Here you can implement your logic to generate random items.
    // For simplicity, we'll use a fixed list.
    return const [
      FortuneItem(child: Text('Item 1')),
      FortuneItem(child: Text('Item 2')),
      FortuneItem(child: Text('Item 3')),
      FortuneItem(child: Text('Item 4')),
    ];
  }
}
