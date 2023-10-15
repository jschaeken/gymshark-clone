import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/config.dart';
import 'package:gymshark_clone/domain/models/tab_bar_item.dart';
import 'package:gymshark_clone/presentation/pages/explore_page.dart';
import 'package:gymshark_clone/presentation/state_managment/navigation_provider.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<TabBarItem> tabBarItems = Config.tabBarItems;

  final List<Widget> tabBarPages = [
    const ExplorePage(pageTitle: 'EXPLORE'),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];

  final PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    //listen for changes in the current index from the provider
    context.read<PageNavigationProvider>().addListener(() {
      pageController
          .jumpToPage(context.read<PageNavigationProvider>().currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: tabBarPages,
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
