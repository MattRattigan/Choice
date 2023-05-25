import 'package:flutter/material.dart';
import 'package:no_name_app/widget/nav/navi.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
     NaviBar navi = NaviBar();
    return Scaffold(
      bottomNavigationBar: navi.customGnav(context: context),
      appBar: AppBar(
        title: Text('Favorite Screen'),
      ),
      body: Center(
        child: Text('This is the Favorites Screen'),
      ),
    );
  }
}