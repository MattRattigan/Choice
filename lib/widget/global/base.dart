import 'package:flutter/material.dart';
import 'package:no_name_app/widget/global/app_bar.dart';
import 'package:no_name_app/components/side_menu.dart';

class BasePage extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;

  const BasePage(
      {Key? key,
      required this.body,
      this.bottomNavigationBar,
      this.resizeToAvoidBottomInset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomNavigationBar: bottomNavigationBar,
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget> [
              CustomSliverBar(scaffoldKey),
              SliverFillRemaining(child: body ?? Container()),
            ],
          ),
        ),
        drawer: const Drawer(child: Sidebar()),
      ),
    );
  }
}




