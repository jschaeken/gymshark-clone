import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gymshark_clone/core/components.dart/category_box.dart';
import 'package:gymshark_clone/core/components.dart/layout.dart';
// import 'package:gymshark_clone/core/components.dart/header.dart';
import 'package:gymshark_clone/core/constants.dart';
import 'package:gymshark_clone/domain/models/category.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({required this.pageTitle, super.key});

  final String pageTitle;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late String pageTitle;
  late ScrollController scrollController;
  late TextEditingController searchController;
  bool overlaySearchBar = false;
  final String accountInitials = 'JS';
  List<Category> demoCategories = [
    Category(
      id: '1',
      imageUrl: 'https://picsum.photos/701',
      title: 'CATEGORY 1',
      subtitle: 'Subtitle 1',
    ),
    Category(
      id: '2',
      imageUrl: 'https://picsum.photos/702',
      title: 'CATEGORY 2',
      subtitle: 'Subtitle 2',
    ),
    Category(
      id: '3',
      imageUrl: 'https://picsum.photos/703',
      title: 'CATEGORY 3',
      subtitle: 'Subtitle 3',
    ),
    Category(
      id: '4',
      imageUrl: 'https://picsum.photos/704',
      title: 'CATEGORY 4',
      subtitle: 'Subtitle 4',
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageTitle = widget.pageTitle;
    scrollController = ScrollController();
    searchController = TextEditingController();
    //When the user scrolls up, the bar will be visible
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
              ScrollDirection.forward &&
          !overlaySearchBar &&
          scrollController.offset > 70) {
        setState(() {
          overlaySearchBar = true;
          print('overlaySearchBar: $overlaySearchBar');
        });
      } else if (overlaySearchBar &&
          (scrollController.position.userScrollDirection ==
                  ScrollDirection.reverse ||
              scrollController.offset < 70)) {
        setState(() {
          overlaySearchBar = false;
          print('overlaySearchBar: $overlaySearchBar');
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
      alignment: Alignment.topCenter,
      children: [
        RefreshIndicator.adaptive(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            //show snackbar
            if (mounted) {
              //dismissing all snackbars before showing the new one
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Refreshed'),
                ),
              );
            }
          },
          color: Theme.of(context).primaryColor,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                // Header Title and Account
                HeaderRow(
                  pageTitle: pageTitle,
                  accountInitials: accountInitials,
                  child: CustomSearchBar(controller: searchController),
                ),

                // Search Bar

                // Categories
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: demoCategories.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: Constants.padding,
                      child: CategoryImageBox(
                        imageUrl: demoCategories[index].imageUrl,
                        title: demoCategories[index].title,
                        subtitle: demoCategories[index].subtitle,
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        // Overlay Search Bar
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
