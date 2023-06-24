import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class NaviBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NaviBarModel>(
      builder: (context, naviBarModel, child) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.red,
              Colors.orange,
            ], begin: Alignment.bottomRight, end: Alignment.topLeft),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 20.0,
            ),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              haptic: true,
              color: Colors.white,
              activeColor: Colors.white,
              gap: 9,
              tabBackgroundColor: Colors.grey.shade800,
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.all(16.0),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  onPressed: () {
                    naviBarModel.selectedIndex = 0;
                    Navigator.pushNamed(
                      context,
                      '/homeScreen',
                    );
                  },
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Favorites',
                  onPressed: () {
                    naviBarModel.selectedIndex = 1;
                    Navigator.pushNamed(
                      context,
                      '/favoriteList',
                    );
                  },
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                  onPressed: () {
                    naviBarModel.selectedIndex = 2;
                    Navigator.pushNamed(
                      context,
                      '/questionScreen',
                    );
                  },
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                  onPressed: () {
                    naviBarModel.selectedIndex = 3;
                    Navigator.pushNamed(
                      context,
                      '/settingsScreen',
                    );
                  },
                ),
              ],
              selectedIndex: naviBarModel.selectedIndex,
            ),
          ),
        );
      },
    );
  }
}

class NaviBarModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
