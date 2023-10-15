import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/constants.dart';

class ImageGallery extends StatelessWidget {
  const ImageGallery({
    super.key,
    required this.imageController,
    required this.imageUrls,
    required this.imageIndex,
  });

  final PageController imageController;
  final List<String> imageUrls;
  final int imageIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Product Image
          PageView.builder(
            controller: imageController,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              );
            },
          ),

          // Progress Indicator
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: Constants.padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < imageUrls.length; i++)
                    Flexible(
                      child: Padding(
                        padding: Constants.padding.copyWith(right: 5, left: 5),
                        child: Container(
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: Constants.borderRadius,
                            color: i == imageIndex
                                ? Theme.of(context).canvasColor
                                : Colors.transparent,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
