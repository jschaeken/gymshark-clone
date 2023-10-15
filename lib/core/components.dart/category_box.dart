import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/components.dart/icon_components.dart';
import 'package:gymshark_clone/core/components.dart/text_components.dart';
import 'package:gymshark_clone/core/constants.dart';

class CategoryImageBox extends StatelessWidget {
  const CategoryImageBox({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: Constants.borderRadius,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageUrl,
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Constants.borderRadius,
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.9),
                Theme.of(context).primaryColor.withOpacity(0.0),
              ],
            ),
          ),
          child: Padding(
            padding: Constants.padding,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title and Subtitle Text
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        TextDisplay(
                          text: title,
                          color: Theme.of(context).canvasColor,
                        ),

                        // Subtitle
                        TextBody(
                          text: subtitle,
                          color: Theme.of(context).canvasColor,
                        ),
                      ],
                    ),
                  ),

                  // Forward Arrow Icon
                  Container(
                    padding: Constants.padding,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).canvasColor,
                    ),
                    child: const CustomIcon(
                      CupertinoIcons.chevron_forward,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
