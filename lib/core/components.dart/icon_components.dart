import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(this.iconData, {this.size, super.key});

  final IconData iconData;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size ?? 24,
      color: Theme.of(context).primaryColor,
    );
  }
}
