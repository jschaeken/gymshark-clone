import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/config.dart';
import 'package:gymshark_clone/domain/models/tab_bar_item.dart';
import 'package:gymshark_clone/presentation/pages/accounts_page.dart';
import 'package:gymshark_clone/presentation/pages/bag_page.dart';
import 'package:gymshark_clone/presentation/pages/explore_page.dart';
import 'package:gymshark_clone/presentation/pages/favourites_page.dart';
import 'package:gymshark_clone/presentation/pages/shop_page.dart';
import 'package:gymshark_clone/presentation/state_managment/navigation_provider.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<TabBarItem> tabBarItems = Config.tabBarItems;
  late List<GlobalKey<NavigatorState>> keys;

  final List<Widget> tabBarPages = [
    const ExplorePage(pageTitle: 'EXPLORE'),
    const ShopPage(pageTitle: 'SHOP'),
    const BagPage(pageTitle: 'BAG'),
    const FavoritesPage(pageTitle: 'FAVORITES'),
    const AccountPage(pageTitle: 'ACCOUNT'),
  ];

  @override
  void initState() {
    super.initState();
    keys = tabBarPages.map((page) => GlobalKey<NavigatorState>()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: context.watch<PageNavigationProvider>().currentIndex,
          children: [
            ...tabBarPages.map(
              (page) => OffstageNavigator(
                index: tabBarPages.indexOf(page),
                navKey: keys[tabBarPages.indexOf(page)],
                child: page,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: tabBarItems
            .map((item) => BottomNavigationBarItem(
                icon: Icon(item.icon[0]),
                activeIcon: Icon(item.icon[1]),
                label: item.title))
            .toList(),
        currentIndex: context.watch<PageNavigationProvider>().currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColor.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          context.read<PageNavigationProvider>().changeIndex(value);
        },
      ),
    );
  }
}

class OffstageNavigator extends StatelessWidget {
  const OffstageNavigator(
      {required this.child,
      required this.index,
      required this.navKey,
      super.key});

  final Widget child;
  final int index;
  final GlobalKey<NavigatorState> navKey;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: context.watch<PageNavigationProvider>().currentIndex != index,
      child: Navigator(
        key: navKey,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => child,
          );
        },
      ),
    );
  }
}
