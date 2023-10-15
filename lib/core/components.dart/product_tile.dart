import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/components.dart/icon_components.dart';
import 'package:gymshark_clone/core/components.dart/text_components.dart';
import 'package:gymshark_clone/core/constants.dart';
import 'package:gymshark_clone/domain/models/product.dart';

class LargeProductTile extends StatelessWidget {
  const LargeProductTile({
    super.key,
    required this.product,
    required this.onFavoriteTap,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onFavoriteTap;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: Constants.padding,
        decoration: BoxDecoration(
          borderRadius: Constants.borderRadius,
          color: Theme.of(context).canvasColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Product Image
                      Padding(
                        padding: Constants.padding,
                        child: Image.network(
                          product.imageUrls[0],
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Gradient Overlay
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(1),
                              Colors.black.withOpacity(.6),
                              Colors.black.withOpacity(.2),
                              Colors.black.withOpacity(0),
                            ],
                          ),
                        ),
                      ),

                      // Favorite Icon
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: Constants.padding,
                          child: GestureDetector(
                            onTap: onFavoriteTap,
                            child: CustomIcon(
                              product.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          ),
                        ),
                      ),

                      // Product Name and Price
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: Constants.padding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextBody(
                                text: product.name,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 5),
                              TextBody(
                                text: '€${product.price}',
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
