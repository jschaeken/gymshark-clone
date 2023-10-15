import 'package:flutter/cupertino.dart';

import '../domain/models/tab_bar_item.dart';

class Config {
  //TabBar Items
  static const List<TabBarItem> tabBarItems = [
    TabBarItem(
      icon: [CupertinoIcons.house, CupertinoIcons.house_fill],
      title: 'Explore',
    ),
    TabBarItem(
      icon: [CupertinoIcons.heart, CupertinoIcons.heart_fill],
      title: 'Favorites',
    ),
    TabBarItem(
      icon: [CupertinoIcons.cart, CupertinoIcons.cart_fill],
      title: 'Cart',
    ),
    TabBarItem(
      icon: [CupertinoIcons.person, CupertinoIcons.person_fill],
      title: 'Profile',
    ),
  ];
}
