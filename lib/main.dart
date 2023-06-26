import 'package:flutter/material.dart';
import 'package:no_name_app/components/side_menu.dart';
import 'package:no_name_app/pages/home_screen.dart';
import 'package:no_name_app/pages/login_screen.dart';
import 'package:no_name_app/pages/questions_screen.dart';
import 'package:no_name_app/pages/random_choice_screen.dart';
import 'package:no_name_app/pages/settings_screen.dart';
import 'package:no_name_app/widget/nav/navi.dart';
import 'pages/splash_screen.dart';
import 'package:no_name_app/pages/favorites/favorite_list.dart';
import 'package:no_name_app/pages/favorites/favorite_list_models.dart';
import 'package:no_name_app/pages/favorites/favorite_page.dart';
import 'package:no_name_app/pages/favorites/favorite_page_models.dart';
import 'package:no_name_app/pages/favorites/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FavoriteListModel()),
        ChangeNotifierProxyProvider<FavoriteListModel, FavoritePageModel>(
          create: (context) => FavoritePageModel(),
          update: (context, favoriteList, favoritePage) {
            if (favoritePage == null) {
              throw ArgumentError.notNull('favoritePage');
            }
            favoritePage.favoritelist = favoriteList;
            return favoritePage;
          },
        ),
        ChangeNotifierProvider(create: (context) => NaviBarModel()), // Add this line
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Choice',
        theme: appTheme,
        routes: {
          '/favoriteList': (context) => FavoriteList(),
          '/homeScreen' : (context) => HomeScreen(),
          '/questionScreen' :(context) => QuestionScreen(),
          '/favoritePage': (context) => const FavoritePage(),
          '/settingsScreen': (context) => const SettingsScreen(),
          '/loginScreen' : (context) => const LoginScreen(),
          '/randomChoiceScreen' : (context) => WheelScreen(),
          '/sideBar' : (context) => const Sidebar(),
        },
        home: SplashScreen(),
      ),
    );
  }
}
