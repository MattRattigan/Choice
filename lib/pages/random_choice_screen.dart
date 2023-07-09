import 'package:flutter/material.dart';
import 'package:no_name_app/widget/global/base.dart';
import 'package:no_name_app/widget/nav/navi.dart';
import 'dart:async';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

class WheelScreen extends StatefulWidget {
  const WheelScreen({Key? key}) : super(key: key);

  @override
  State<WheelScreen> createState() => _SpinWheelState();
}

TextEditingController textController = TextEditingController();

class _SpinWheelState extends State<WheelScreen> {
  final selected = BehaviorSubject<int>();
  int rewards = 0;

  List<FortuneItem> wheelItems = [
    FortuneItem(child: Text('Item 1')),
    FortuneItem(child: Text('Item 2')),
    FortuneItem(child: Text('Item 3')),
    FortuneItem(child: Text('Item 4')),
    FortuneItem(child: Text('Item 5')),
  ];

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bottomNavigationBar: NaviBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: 'Add Restaurants',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      addItemToList();
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: FortuneWheel(
                selected: selected.stream,
                animateFirst: false,
                items: wheelItems,
                onAnimationEnd: () {
                  
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selected.add(Fortune.randomInt(0, wheelItems.length));
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 1.0),
                height: 40,
                width: 120,
                color: Colors.redAccent,
                child: Center(
                  child: Text("SPIN"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addItemToList() {
    String newItem = textController.text;
    if (newItem.isNotEmpty) {
      setState(() {
        wheelItems.add(FortuneItem(child: Text(newItem)));
      });
      textController.clear();
    }
  }
}
