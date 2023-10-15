import 'package:flutter/cupertino.dart';

import '../domain/models/tab_bar_item.dart';

class Config {
  //TabBar Items
  static const List<TabBarItem> tabBarItems = [
    TabBarItem(
      icon: [CupertinoIcons.house, CupertinoIcons.house_fill],
      title: 'Explore',
    ),
    //Category and search
    TabBarItem(
      icon: [
        CupertinoIcons.square_stack_3d_down_right,
        CupertinoIcons.square_stack_3d_down_right_fill
      ],
      title: 'Shop',
    ),
    TabBarItem(
      icon: [CupertinoIcons.bag, CupertinoIcons.bag_fill],
      title: 'Bag',
    ),
    TabBarItem(
      icon: [CupertinoIcons.heart, CupertinoIcons.heart_fill],
      title: 'Favorites',
    ),
    TabBarItem(
      icon: [CupertinoIcons.person, CupertinoIcons.person_fill],
      title: 'Profile',
    ),
  ];
}
