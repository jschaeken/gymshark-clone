import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/components.dart/icon_components.dart';
import 'package:gymshark_clone/core/components.dart/text_components.dart';
import 'package:gymshark_clone/core/constants.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    super.key,
    required this.pageTitle,
    required this.accountInitials,
  });

  final String pageTitle;
  final String accountInitials;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //Page Title
          TextHeadline(text: pageTitle),

          //Account Icon
          // const CustomIcon(
          //   CupertinoIcons.person_circle_fill,
          //   size: 40,
          // ),
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: TextBody(
              text: accountInitials,
              color: Theme.of(context).canvasColor,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: Constants.borderRadius,
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ]),
      child: Padding(
        padding: Constants.innerPadding,
        child: TextField(
          controller: controller,
          cursorColor: Theme.of(context).primaryColor,
          decoration: const InputDecoration(
            hintText: 'Try a product or category',
            prefixIcon: CustomIcon(CupertinoIcons.search),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
