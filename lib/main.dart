
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as river;
import 'package:no_name_app/routes/app_routing.dart';
import 'package:no_name_app/widget/nav/navi.dart';
import 'package:no_name_app/pages/favorites/favorite_list_models.dart';
import 'package:no_name_app/pages/favorites/favorite_page_models.dart';
import 'package:no_name_app/pages/favorites/theme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const river.ProviderScope(child: MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    @override
    AppRouter appRouter = AppRouter();
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
        ChangeNotifierProvider(create: (context) => NaviBarModel()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Choice',
        theme: appTheme,
        routerConfig: appRouter.config(),
      ),
    );
  }
}


