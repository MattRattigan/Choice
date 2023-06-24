import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:no_name_app/widget/global/text.dart';

class TestingPage extends StatelessWidget {
  const TestingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomSliverBar(),
            const SliverFillRemaining(
              child: TabBarView(
                children: [
                  Icon(Icons.home),
                  Icon(Icons.abc),
                  Icon(Icons.cabin),
                  Icon(Icons.holiday_village),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliverBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const DeviceText(
        text: "Choice",
        fontSize: 24,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => print("Hello World"),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
      backgroundColor: Colors.orange,
      elevation: 20,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.red,
            Colors.orange,
          ], begin: Alignment.bottomRight, end: Alignment.topLeft),
        ),
      ),
      bottom: TabBar(
        indicatorColor: Colors.amber,
        indicatorWeight: 5,
        tabs: [
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/randomChoiceScreen');
              },
              child: Tab(
                  icon: SvgPicture.asset('assets/images/wheel.svg',
                      width: 26, height: 26),
                  text: "Wheel")),
          Tab(icon: Icon(Icons.abc), text: "Sayonara"),
          Tab(icon: Icon(Icons.cabin), text: "Nope"),
          Tab(icon: Icon(Icons.holiday_village), text: "Nah Fam"),
        ],
      ),
    );
  }
}
