import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Navigation',
      theme: ThemeData(
        brightness: Brightness.dark,
        hoverColor: Colors.amber,
      ),
      home: SplashScreen(),
    );
  }
}
