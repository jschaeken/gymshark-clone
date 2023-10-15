import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gymshark_clone/core/components.dart/header.dart';
import 'package:gymshark_clone/core/constants.dart';
import 'package:gymshark_clone/presentation/pages/category_shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({required this.pageTitle, super.key});

  final String pageTitle;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with SingleTickerProviderStateMixin {
  late String pageTitle;
  late ScrollController scrollController;
  late TextEditingController searchController;
  late TabController tabController;
  bool overlaySearchBar = false;
  final String accountInitials = 'JS';

  @override
  void initState() {
    super.initState();
    pageTitle = widget.pageTitle;
    scrollController = ScrollController();
    searchController = TextEditingController();
    tabController = TabController(length: 3, vsync: this);

    //When the user scrolls up, the bar will be visible
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
              ScrollDirection.forward &&
          !overlaySearchBar &&
          scrollController.offset > 70) {
        setState(() {
          overlaySearchBar = true;
        });
      } else if (overlaySearchBar &&
          (scrollController.position.userScrollDirection ==
                  ScrollDirection.reverse ||
              scrollController.offset < 70)) {
        setState(() {
          overlaySearchBar = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            HeaderRow(pageTitle: pageTitle, accountInitials: accountInitials),
            // Search Bar
            Padding(
              padding: Constants.padding,
              child: CustomSearchBar(controller: searchController),
            ),
            // Categories Tab Bar
            TabBar(
              controller: tabController,
              labelColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(text: 'Food & Drink'),
                Tab(text: 'Vitamin & Body'),
                Tab(text: 'Household'),
              ],
            ),
            // Tab Bar View
            Flexible(
              // height: MediaQuery.of(context).size.height,
              child: TabBarView(
                viewportFraction: 1,
                // physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: const [
                  CategoryShop(id: 'Food'),
                  CategoryShop(id: 'Vitamin & Body'),
                  CategoryShop(id: 'Household'),
                ],
              ),
            ),
          ],
        ),
        // Search Bar Overlay
        Visibility(
          visible: overlaySearchBar,
          child: Container(
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: Constants.padding,
              child: CustomSearchBar(controller: searchController),
            ),
          ).animate().fadeIn(
                duration: const Duration(milliseconds: 100),
              ),
        ),
      ],
    );
  }
}
