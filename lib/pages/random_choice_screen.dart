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
    const FortuneItem(child: Text('Item 1')),
    const FortuneItem(child: Text('Item 2')),
    const FortuneItem(child: Text('Item 3')),
    const FortuneItem(child: Text('Item 4')),
    const FortuneItem(child: Text('Item 5')),
    const FortuneItem(child: Text('Item 6')),
    const FortuneItem(child: Text('Item 7')),
    const FortuneItem(child: Text('Item 8')),
    const FortuneItem(child: Text('Item 9')),
    const FortuneItem(child: Text('Item 10')),
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
    body: Stack(
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  onAnimationEnd: () {},
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
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text("SPIN",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    ),
                  ),
                ),
              ),

               
              // Add Container with BoxDecoration to the "List" button and Align it to the right
Align(
  alignment: Alignment.centerRight,
  child: Container(
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 252, 84, 84),
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: ListTile(
      title: const Text(
        "List",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      onTap: () {
        // Show the list of FortuneItems as a bottom sheet
        showItemList();
      },
    ),
  ),
),


            ],
          ),
        ),
      ],
    ),
  );
}

void showItemList() {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: wheelItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(wheelItems[index].child.toString()),
            // Optional: You can add functionality for tapping each item in the list
            // For example, you can set the selected index and close the bottom sheet.
            onTap: () {
              setState(() {
                selected.add(index);
              });
              Navigator.pop(context);
            },
          );
        },
      );
    },
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