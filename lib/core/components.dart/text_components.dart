import 'package:flutter/material.dart';

class TextDisplay extends StatelessWidget {
  const TextDisplay({
    super.key,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            Theme.of(context).textTheme.displayMedium!.copyWith(color: color));
  }
}

class TextHeadline extends StatelessWidget {
  const TextHeadline({
    super.key,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            Theme.of(context).textTheme.headlineMedium!.copyWith(color: color));
  }
}

class TextSubHeadline extends StatelessWidget {
  const TextSubHeadline({
    super.key,
    required this.text,
    this.color,
    this.fontWeight = FontWeight.bold,
  });

  final String text;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: color, fontWeight: fontWeight, fontSize: 18));
  }
}

class TextBody extends StatelessWidget {
  const TextBody({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
    this.decoration,
  });

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: color, fontWeight: fontWeight, decoration: decoration));
  }
}
