import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:no_name_app/components/side_menu.dart';
import 'package:no_name_app/widget/global/choice_theme.dart';
import 'package:no_name_app/widget/global/text.dart';


class CustomSliverBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  const CustomSliverBar(this._scaffoldKey, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: kToolbarHeight + 2,
      title: const DeviceText(
        text: "Choice",
        fontSize: 24,
      ),
      centerTitle: true,
      // leading: IconButton(
      //   icon: const Icon(Icons.menu),
      //   onPressed: () => Navigator.pushNamed(context, '/sideBar'),
      // ),
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
      
    );
  }
}
