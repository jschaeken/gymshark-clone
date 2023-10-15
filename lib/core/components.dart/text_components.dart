import 'package:flutter/material.dart';

class TextHeadline extends StatelessWidget {
  const TextHeadline({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headlineMedium);
  }
}
