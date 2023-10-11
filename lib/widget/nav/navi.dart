import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import 'package:no_name_app/routes/app_routing.gr.dart';

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
              rippleColor: Colors.orange[300]!,
              hoverColor: Colors.amber[100]!,
              haptic: true,
              color: Colors.white,
              activeColor: Colors.white,
              gap: 9,
              tabBackgroundColor: Colors.amber.shade500,
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.all(16.0),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  onPressed: () {
                    naviBarModel.selectedIndex = 0;
                    AutoRouter.of(context).push(HomeRoute());
                  },
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Favorites',
                  onPressed: () {
                    naviBarModel.selectedIndex = 1;
                    AutoRouter.of(context).push(const FavoriteList());
                  },
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                  onPressed: () {
                    naviBarModel.selectedIndex = 2;
                    AutoRouter.of(context).push(QuestionRoute());
                  },
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                  onPressed: () {
                    naviBarModel.selectedIndex = 3;
                    AutoRouter.of(context).push(const SettingsRoute());
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

// class NaviBar extends StatelessWidget {
//   const NaviBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AutoTabsRouter(
//       routes: [
//         HomeRoute(),
//         const FavoriteList(),
//         QuestionRoute(),
//         const SettingsRoute(),
//       ],
//       builder: (context, child) {
//         final tabsRouter = AutoTabsRouter.of(context);
//         return Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [
//               Colors.red,
//               Colors.orange,
//             ], begin: Alignment.bottomRight, end: Alignment.topLeft),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 15.0,
//               vertical: 20.0,
//             ),
//             child: GNav(
//               onTabChange: (value) {
//                 print(
//                     "\nHere I'am! value: $value\n tabsRouter.activeIndex is what: ${tabsRouter.activeIndex}");
//                 print("Active route: ${tabsRouter.current.name}");
//               },
//               rippleColor: Colors.orange[300]!,
//               hoverColor: Colors.amber[100]!,
//               haptic: true,
//               color: Colors.white,
//               activeColor: Colors.white,
//               gap: 9,
//               tabBackgroundColor: Colors.amber.shade500,
//               duration: const Duration(milliseconds: 400),
//               padding: const EdgeInsets.all(16.0),
//               tabs: const [
//                 GButton(
//                   icon: Icons.home,
//                   text: 'Home',
//                 ),
//                 GButton(
//                   icon: Icons.favorite_border,
//                   text: 'Favorites',
//                 ),
//                 GButton(
//                   icon: Icons.search,
//                   text: 'Search',
//                 ),
//                 GButton(
//                   icon: Icons.settings,
//                   text: 'Settings',
//                 ),
//               ],
//               selectedIndex: tabsRouter.activeIndex,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class NaviBarModel extends ChangeNotifier {
//   int _selectedIndex = 0;

//   int get selectedIndex => _selectedIndex;

//   set selectedIndex(int index) {
//     _selectedIndex = index;
//     notifyListeners();
//   }
// }
