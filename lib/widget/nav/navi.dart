import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:no_name_app/pages/favorite_screen.dart';
import 'package:no_name_app/pages/home_screen.dart';
import 'package:no_name_app/pages/questions_screen.dart';
import 'package:no_name_app/pages/settings_screen.dart';

class NaviBar {
  int _selectedIndex = 0;
  Container customGnav({
    required BuildContext context,
    Color bgColor = Colors.black,
    Color color = Colors.white,
    Color activeColor = Colors.white,
    Color tabBg = Colors.grey,
  }) {
    if (tabBg == Colors.grey) tabBg = Colors.grey.shade800;
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0,
        ),
        child: GNav(
          backgroundColor: bgColor,
          color: color,
          activeColor: activeColor,
          gap: 9,
          tabBackgroundColor: tabBg,
          padding: const EdgeInsets.all(16.0),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            GButton(
              icon: Icons.favorite_border,
              text: 'Favorites',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  FavoriteScreen()),);
              },
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  QuestionScreen()),);
              },
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
               onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  SettingsScreen()),);
              },
            ),
          ],
        ),
      ),
    );
  }
}

//          selectedIndex: _selectedIndex,
//          onTabChange: updateIndex,