import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class RandomWheel {
  final StreamController<int> controller = StreamController<int>();

  RandomWheel({Key? key});

  Widget build(BuildContext context) {
    var randomItems = generateRandomItems();  // Method to generate random items

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
