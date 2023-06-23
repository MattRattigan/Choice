import 'package:flutter/material.dart';
import 'package:no_name_app/pages/favorites/favorite_page_models.dart';
import 'package:no_name_app/widget/nav/navi.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    NaviBar navi = NaviBar();
    return Scaffold(
      bottomNavigationBar: navi.customGnav(context: context),
      appBar: AppBar(
        title: Text(
          'Favorite Page',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Container(
        color: Colors.white,
        child:  Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: _favoritePageList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _favoritePageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // NaviBar navi = NaviBar();
    var itemNameStyle = Theme.of(context).textTheme.titleLarge;
    var favoritepage = context.watch<FavoritePageModel>();

    return ListView.builder(
      itemCount: favoritepage.items.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: Image.asset(favoritepage.items[index].image),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            favoritepage.remove(favoritepage.items[index]);
          },
        ),
        title: Text(
          favoritepage.items[index].name,
          style: itemNameStyle,
        ),
        subtitle: Text(
          favoritepage.items[index].desc,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
