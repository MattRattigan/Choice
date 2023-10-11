import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:no_name_app/routes/app_routing.gr.dart';
import 'intro_screen.dart';
import 'package:no_name_app/widget/global/text.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // You can change the duration to fit your needs
    Future.delayed(Duration(seconds: 3), () {
      AutoRouter.of(context).push(const IntroRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    TitleText title = TitleText();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: title.defaultTitle(),
      ),
    );
  }
}
