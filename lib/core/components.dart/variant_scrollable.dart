import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/constants.dart';
import 'package:gymshark_clone/domain/models/product.dart';

class VariantScrollable extends StatelessWidget {
  const VariantScrollable({
    super.key,
    required this.product,
    required this.selectedVariantIndex,
    required this.changeSelectedVariantIndex,
  });

  final Product product;
  final int selectedVariantIndex;
  final Function(int) changeSelectedVariantIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.variants.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: Constants.innerPadding
                .copyWith(right: 10, left: index == 0 ? 8 : 0),
            child: GestureDetector(
              onTap: () {
                changeSelectedVariantIndex(index);
              },
              child: Container(
                width: 61,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: index == selectedVariantIndex
                            ? Colors.black
                            : Colors.transparent,
                      ),
                      child: Padding(
                        padding: Constants.innerPadding,
                        child: Image.network(
                          product.variants[index].imageUrls[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
