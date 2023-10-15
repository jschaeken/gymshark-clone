import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/components.dart/text_components.dart';

class FeaturedBrandTile extends StatelessWidget {
  const FeaturedBrandTile({
    super.key,
    required this.brand,
  });

  final List<String> brand;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(brand[1]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: TextBody(
            text: brand[0],
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
