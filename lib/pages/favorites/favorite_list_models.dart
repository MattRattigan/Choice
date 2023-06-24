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
    "A world-renowned American fast-food chain known for its hamburgers, cheeseburgers, and french fries. It also features chicken products, breakfast items, soft drinks, milkshakes, and desserts.",
    "An American fast-casual restaurant chain focused on hamburgers, hot dogs, and French fries, with a strong emphasis on customizable, made-to-order food.",
    "A fast-food restaurant chain serving American Chinese cuisine. Menu items include Orange Chicken, Kung Pao Chicken, and Beijing Beef.",
    "An American gourmet burger chain focused on all-natural, free-range beef without steroids, antibiotics, and growth hormones. They also offer vegetarian options.",
    "An American casual dining restaurant chain that specializes in seafood, including lobster, shrimp, fish, crab, and mollusks.",
    "Known for its catchphrase \"Pizza! Pizza!\", Little Caesars is an international fast-food chain that specializes in pizza.",
    "A sports bar and restaurant chain that offers comfort food, draft beer, and a casual, rustic atmosphere. Known for their 'scenic views'.",
    " A local restaurant serving traditional Salvadoran cuisine, including pupusas, yuca frita, and other Central American specialties.",
    "Formerly known as Miami Subs, this restaurant serves a mix of everything from cheesesteaks to wings, gyros, burgers, and pitas. It's a combination of a fast-food restaurant and a casual dining site.",
    "Often featuring Caribbean cuisine, Dutch Pot restaurants typically offer jerk chicken, curry goat, oxtail, and an array of island-style dishes. Please note that the specifics may vary based on location.",
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
