import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:no_name_app/widget/nav/navi.dart';

class TempFavoriteScreen extends StatefulWidget {
  const TempFavoriteScreen();

  @override
  State<StatefulWidget> createState() {
    return _TempFavoriteScreenState();
  }
}

class _TempFavoriteScreenState extends State<TempFavoriteScreen> {
  late double _deviceHeight, _deviceWidth;
  String? _newTaskContent;
  Box? _box;

  _TempFavoriteScreenState();

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
    return Scaffold(
      bottomNavigationBar: navi.customGnav(context: context),
      appBar: AppBar(
        title: const Text("Favorite Screen"),
      ),
    );
  }

  // Widget _tasksView() {
  //   return FutureBuilder(
  //     future: Hive.openBox('tasks'),
  //     builder: (BuildContext _context, AsyncSnapshot _snapshot) {
  //       if (_snapshot.hasData) {
  //         _box = _snapshot.data;
  //         return _tasksList();
  //       } else {
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }
  //     },
  //   );
  // }

  // Widget _tasksList() {
  //   List tasks = _box.values.toList();
  //   return ListView.builder(itemBuilder: (BuildContext _context, int _index) {
  //     var task = tasks.fromMap(tasks[_index]);
  //     return ListTile(

  //     );
  //   });
  // }

  // @override
  // void dispose() {
  //   _box?.close();
  //   super.dispose();
  // }
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