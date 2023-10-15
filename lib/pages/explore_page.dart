import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/constants.dart';

import '../core/components.dart/icon_components.dart';
import '../core/components.dart/text_components.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({required this.pageTitle, super.key});

  final String pageTitle;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late String pageTitle;

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
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: Constants.padding,
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: Constants.borderRadius,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://picsum.photos/700',
                          ),
                        ),
                      ),
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
