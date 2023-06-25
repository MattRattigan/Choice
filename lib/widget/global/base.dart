import 'package:flutter/material.dart';
import 'package:no_name_app/widget/global/app_bar.dart';

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomNavigationBar: bottomNavigationBar,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              CustomSliverBar(),
              SliverFillRemaining(child: body),
            ],
          ),
        ),
      ),
    );
  }
}
