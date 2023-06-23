class FavoriteListModel {
  static List<String> itemNames = [
    "McDonalds",
    "Five Guys",
    "Panda Express",
    "Burger Fi",
    "Red Lobster",
    "Little Caesars",
    "Twin Peaks",
    "El Tipico Guanaco Restaurant",
    "Miami Grill",
    "Dutch Pot",
  ];

  static List<String> itemDesc = [
    "some app for any developer",
    "some app for any developer",
    "some app for any developer",
    "some app for any developer",
    "some app for any developer",
    "some app for any developer",
    "some app for any developer",
    "some app for any developer",
    "some app for any developer",
    "some app for any developer",
  ];

  static List<String> itemImages = [
    ("assets/images/favorite_image/mc_donalds_img.jpg"),
    ("assets/images/favorite_image/five_guys_img.jpg"),
    ("assets/images/favorite_image/panda_exp_img.jpg"),
    ("assets/images/favorite_image/burger_fi_img.png"),
    ("assets/images/favorite_image/red_lobster_img.jpg"),
    ("assets/images/favorite_image/little_caesars_img.jpg"),
    ("assets/images/favorite_image/twin_peaks_img.jpg"),
    ("assets/images/favorite_image/el_tipico_guanaco_img.jpg"),
    ("assets/images/favorite_image/miami_grill_img.jpg"),
    ("assets/images/favorite_image/dutch_pot_img.png"),
  ];

  Item getById(int id) => Item(
        id,
        itemNames[id % itemNames.length],
        itemDesc[id % itemDesc.length],
        itemImages[id % itemImages.length],
      );

  Item getByPosition(int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String image;

  const Item(
    this.id,
    this.name,
    this.desc,
    this.image,
  );

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
