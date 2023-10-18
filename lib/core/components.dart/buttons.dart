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
        height: 50,
        child: Padding(
          padding: Constants.padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBody(text: text),
              CustomIcon(
                Icons.arrow_drop_down,
                color: Theme.of(context).unselectedWidgetColor,
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
  });

  final Widget child;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
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
            child: Padding(
              padding: Constants.padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
