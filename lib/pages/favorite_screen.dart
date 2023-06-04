import 'package:flutter/material.dart';
import 'package:no_name_app/widget/global/buttons.dart';
import 'package:no_name_app/widget/nav/navi.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:no_name_app/widget/global/text.dart';
import 'package:hive_flutter/hive_flutter.dart';


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen();

  @override
  State<StatefulWidget> createState() {
    return _FavoriteScreenState();
  }
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late double _deviceHeight, _deviceWidth;
  String? _newTaskContent;
  Box? _box;

  _FavoriteScreenState();

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

  Future<void> _initializeHive() async {
    await Hive.initFlutter("hive_boxes");
    _box = await Hive.openBox('tasks');
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    NaviBar navi = NaviBar();
    if (_box == null) {
      return const CircularProgressIndicator();
    }
    return Scaffold(
      bottomNavigationBar: navi.customGnav(context: context),
      appBar: AppBar(
        title: const Text('Favorite Screen'),
      ),
      body:
          // favoriteBox("Hello World", "United States", 'assets/images/wheel.svg'),
          _tasksView(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _tasksView() {
    return FutureBuilder(
      future: Hive.openBox('tasks'),
      builder: (BuildContext _context, AsyncSnapshot _snapshot) {
        if (_snapshot.hasData) {
          _box = _snapshot.data;
          return _tasksList();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _tasksList() {
    List tasks = _box!.values.toList();
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext _context, int _index) {
        var task = Task.fromMap(tasks[_index]);
        return ListTile(
          title: Text(
            task.content,
            style: TextStyle(
              decoration: task.done ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            task.timestamp.toString(),
          ),
          trailing: Icon(
            task.done
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank_outlined,
            color: Colors.red,
          ),
          onTap: () {
            task.done = !task.done;
            _box!.putAt(
              _index,
              task.toMap(),
            );
            setState(() {});
          },
          onLongPress: () {
            _box!.deleteAt(_index);
            setState(() {});
          },
        );
      },
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: _displayTaskPopup,
      child: const Icon(
        Icons.add,
      ),
    );
  }

  void _displayTaskPopup() {
    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          title: const Text("Add To Favorites"),
          content: TextField(
            onSubmitted: (_) {
              if (_newTaskContent != null) {
                var _task = Task(
                    content: _newTaskContent!,
                    timestamp: DateTime.now(),
                    done: false);
                _box!.add(_task.toMap());
                setState(() {
                  _newTaskContent = null;
                  Navigator.pop(context);
                });
              }
            },
            onChanged: (_value) {
              setState(() {
                _newTaskContent = _value;
              });
            },
          ),
        );
      },
    );
  }

  Container favoriteBox(String title, String location, String locationString,
      {String select = "Select"}) {
    // var width = 500;
    SvgPicture locationPicture = SvgPicture.asset(
      locationString,
      width: 55,
      height: 68,
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Colors.white.withOpacity(0.15),
            Colors.white.withOpacity(0.05)
          ],
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            locationPicture,
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: DeviceText(
                    text: title,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 12.0, top: 20.0, bottom: 6.0),
                      child: Icon(
                        Icons.add_location_alt_outlined,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 12.0, top: 20.0, bottom: 6.0),
                      child: DeviceText(
                        text: location,
                        fontSize: 10,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 20.0, bottom: 6.0),
                      child: DeviceButton(btnText: "Hello"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
    @override
  void dispose() {
    _box?.close();
    super.dispose();
  }
}

class Task {
  String content;
  DateTime timestamp;
  bool done;

  Task({
    required this.content,
    required this.timestamp,
    required this.done,
  });

  factory Task.fromMap(Map task) {
    return Task(
      content: task["content"],
      timestamp: task["timestamp"],
      done: task["done"],
    );
  }

  Map toMap() {
    return {
      "content": content,
      "timestamp": timestamp,
      "done": done,
    };
  }
}