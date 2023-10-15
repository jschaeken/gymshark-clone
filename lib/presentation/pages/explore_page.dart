import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/components.dart/category_box.dart';
import 'package:gymshark_clone/core/constants.dart';
import 'package:gymshark_clone/domain/models/category.dart';

import '../../core/components.dart/icon_components.dart';
import '../../core/components.dart/text_components.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({required this.pageTitle, super.key});

  final String pageTitle;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late String pageTitle;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Title and Account
              Padding(
                padding: Constants.padding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Page Title
                    TextHeadline(text: pageTitle),

                    //Account Icon
                    const CustomIcon(
                      CupertinoIcons.person_circle_fill,
                      size: 40,
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: Constants.padding,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: Constants.borderRadius,
                    color: Theme.of(context).cardColor,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Try a product or category',
                      prefixIcon: CustomIcon(CupertinoIcons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

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
    );
  }
}
