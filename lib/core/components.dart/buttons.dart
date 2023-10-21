import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/components.dart/icon_components.dart';
import 'package:gymshark_clone/core/components.dart/text_components.dart';
import 'package:gymshark_clone/core/constants.dart';

class DropdownButton extends StatelessWidget {
  const DropdownButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).unselectedWidgetColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        height: 43,
        child: Padding(
          padding: Constants.padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextBody(text: text),
              CustomIcon(
                CupertinoIcons.chevron_down,
                color: Theme.of(context).primaryColor,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CtaButton extends StatelessWidget {
  const CtaButton({
    super.key,
    required this.child,
    required this.onTap,
    this.color,
    this.width = double.infinity,
    this.height = 43,
  });

  final Widget child;
  final VoidCallback onTap;
  final Color? color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: color ?? Theme.of(context).indicatorColor,
        borderRadius: Constants.borderRadius,
        child: InkWell(
          onTap: onTap,
          borderRadius: Constants.borderRadius,
          child: Container(
            alignment: Alignment.center,
            //stadium border
            decoration: BoxDecoration(
              borderRadius: Constants.borderRadius,
            ),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
