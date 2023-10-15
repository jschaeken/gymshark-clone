import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/components.dart/icon_components.dart';
import 'package:gymshark_clone/core/components.dart/text_components.dart';
import 'package:gymshark_clone/domain/models/product.dart';

import '../../core/components.dart/image_gallery.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({required this.id, super.key});

  final String id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int imageIndex = 0;

  final Product product = Product(
    name: 'A. Vogel Echinaforce',
    imageUrls: [
      'https://picsum.photos/948',
      'https://picsum.photos/949',
      'https://picsum.photos/950',
      'https://picsum.photos/951',
      'https://picsum.photos/952'
    ],
    price: 100,
    isFavorite: false,
    description: 'Product Description',
  );

  PageController imageController = PageController(
    initialPage: 0,
    viewportFraction: 1,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageController.addListener(() {
      if (imageController.hasClients &&
          imageController.page != null &&
          (imageController.page! + 0.5).toInt() != imageIndex) {
        setState(() {
          imageIndex = (imageController.page! + 0.5).toInt();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: TextHeadline(text: product.name),
          automaticallyImplyLeading: true,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child:
                  const CustomIcon(Icons.arrow_back_ios_new_rounded, size: 22)),
        ),
        body: Column(
          children: [
            // Image Slidable Gallery
            ImageGallery(
              imageController: imageController,
              imageUrls: product.imageUrls,
              imageIndex: imageIndex,
            )
          ],
        ));
  }
}
