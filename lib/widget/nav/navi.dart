import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NaviBar {
  Container customGnav({
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
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ]),
      ),
    );
  }
}
