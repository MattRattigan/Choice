import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:no_name_app/widget/global/text.dart';


class CustomSliverBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  const CustomSliverBar(this._scaffoldKey, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: kToolbarHeight - 25,
      title: const DeviceText(
        text: "Choice",
        fontSize: 24,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      actions: const <Widget>[],
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
              icon: SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset('assets/images/wheel.svg'),
              ),
              text: "Wheel",
            ),
          ),
          const Tab(icon: Icon(Icons.abc), text: "Sayonara"),
          // Tab(icon: Icon(Icons.cabin), text: "Nope"),
          const Tab(
            icon: SizedBox(
              height: 24,
              child: Icon(Icons.notification_add_outlined),
            ),
            text: "Notifications",
          ),
        ],
      ),
    );
  }
}
