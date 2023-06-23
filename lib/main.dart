import 'package:flutter/material.dart';
import 'package:no_name_app/pages/home_screen.dart';
import 'package:no_name_app/pages/login_screen.dart';
import 'package:no_name_app/pages/questions_screen.dart';
import 'pages/splash_screen.dart';
import 'package:no_name_app/pages/favorites/favorite_list.dart';
import 'package:no_name_app/pages/favorites/favorite_list_models.dart';
import 'package:no_name_app/pages/favorites/favorite_page.dart';
import 'package:no_name_app/pages/favorites/favorite_page_models.dart';
import 'package:no_name_app/pages/favorites/theme.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'App Navigation',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         hoverColor: Colors.amber,
//       ),
//       home: SplashScreen(),
//     );
//   }
// }



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
        )
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
          // 'loginScreen' : (context) => LoginScreen(deviceHeight: deviceHeight, deviceWidth: deviceWidth)

        },
        home: SplashScreen(),
      ),
    );
  }
}