import 'package:flutter/material.dart';
import 'package:no_name_app/pages/favorites/favorite_list.dart';
import 'package:no_name_app/pages/favorites/favorite_list_models.dart';
import 'package:no_name_app/pages/favorites/favorite_page.dart';
import 'package:no_name_app/pages/favorites/favorite_page_models.dart';
import 'package:no_name_app/pages/favorites/theme.dart';
import 'package:provider/provider.dart';

class ProviderSetup extends StatelessWidget {
  const ProviderSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FavoriteListModel()),
        ChangeNotifierProxyProvider<FavoriteListModel, FavoritePageModel>(
          create: (context) => FavoritePageModel(),
          update: (context, favoriteList, favoritePage) {
            if (favoritePage == null) throw ArgumentError.notNull('favoritePage');
            favoritePage.favoritelist = favoriteList;
            return favoritePage;
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Favorite Provider',
        theme: appTheme,
        routes: {
          '/': (context) => FavoriteList(),
          '/favoritePage': (context) => FavoritePage(),
        },
      ),
    );
  }
}
