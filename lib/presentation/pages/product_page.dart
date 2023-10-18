import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/components.dart/buttons.dart' as buttons;
import 'package:gymshark_clone/core/components.dart/icon_components.dart';
import 'package:gymshark_clone/core/components.dart/text_components.dart';
import 'package:gymshark_clone/core/components.dart/variant_scrollable.dart';
import 'package:gymshark_clone/domain/models/product.dart';

import '../../core/components.dart/image_gallery.dart';
import '../../core/constants.dart';

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
    price: 100,
    isFavorite: false,
    description: 'Product Description',
    rating: Rating(
      average: 3.5,
      count: 100,
    ),
    variants: [
      ProductVariant(
        name: 'Variant 1',
        imageUrls: [
          'https://abclive1.s3.amazonaws.com/1a901430-9efa-45a3-acc9-316f439be1ee/productimage/WHLV085___L.jpg',
          'https://picsum.photos/913',
        ],
        color: 'Red',
        isFavorite: false,
      ),
      ProductVariant(
        name: 'Variant 2',
        imageUrls: [
          'https://picsum.photos/914',
          'https://picsum.photos/915',
        ],
        color: 'Blue',
        isFavorite: false,
      ),
      ProductVariant(
        name: 'Variant 3',
        imageUrls: [
          'https://picsum.photos/916',
          'https://picsum.photos/917',
        ],
        color: 'Green',
        isFavorite: false,
      ),
    ],
  );

  int selectedVariantIndex = 0;

  PageController imageController = PageController(
    initialPage: 0,
    viewportFraction: 1,
  );

  void changeSelectedVariantIndex(int index) {
    setState(() {
      selectedVariantIndex = index;
      imageIndex = 0;
      imageController.jumpToPage(0);
    });
  }

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Slidable Gallery
              ImageGallery(
                imageController: imageController,
                imageUrls: product.variants[selectedVariantIndex].imageUrls,
                imageIndex: imageIndex,
                onTap: (index) => {},
              ),

              Padding(
                padding: Constants.innerPadding,
                child: const SizedBox(),
              ),

              // Variant Selector (Scrollable Image List)
              VariantScrollable(
                product: product,
                selectedVariantIndex: selectedVariantIndex,
                changeSelectedVariantIndex: changeSelectedVariantIndex,
              ),

              // Product Name and price row
              Padding(
                padding: Constants.padding.copyWith(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextBody(text: product.name),
                    ),
                    TextSubHeadline(
                      text: '€${product.price.toStringAsFixed(2)}',
                    ),
                  ],
                ),
              ),

              //Variant Name
              Padding(
                padding: Constants.padding.copyWith(top: 0, bottom: 8),
                child: TextBody(
                    text: product.variants[selectedVariantIndex].name,
                    color: Theme.of(context).unselectedWidgetColor),
              ),

              //Color
              Padding(
                padding: Constants.padding.copyWith(top: 0),
                child: TextBody(
                  text: product.variants[selectedVariantIndex].color,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
              ),

              // Reviews by stars
              Padding(
                padding: Constants.padding.copyWith(top: 0),
                child: Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Padding(
                        padding: Constants.innerPadding.copyWith(left: 0),
                        child: product.rating.average > i
                            ? const CustomIcon(
                                Icons.star,
                                size: 16,
                              )
                            : product.rating.average >= i - 0.5
                                ? const CustomIcon(
                                    Icons.star_half,
                                    size: 16,
                                  )
                                : const CustomIcon(
                                    Icons.star_border,
                                    size: 16,
                                  ),
                      ),
                    Padding(
                      padding: Constants.innerPadding,
                      child: TextBody(
                        text: '${product.rating.average}',
                      ),
                    ),
                    Padding(
                      padding: Constants.padding
                          .copyWith(top: 0, left: 10, bottom: 0),
                      child: TextBody(
                        text: '(${product.rating.count})',
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),

              // Select Size Title and Size Guide
              Padding(
                padding: Constants.padding,
                child: Row(
                  children: [
                    const Expanded(
                      child: TextSubHeadline(
                        text: 'Select Size',
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomIcon(
                            CupertinoIcons.info_circle_fill,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const TextBody(
                            text: 'Size Guide',
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.underline,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Size Selector and favorite button
              Padding(
                padding: Constants.padding.copyWith(top: 0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: Constants.innerPadding
                            .copyWith(top: 0, bottom: 0, left: 0),
                        child: buttons.DropdownButton(
                          text: 'Select Size',
                          onTap: () {},
                        ),
                      ),
                    ),

                    // Favorite Button
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: Constants.innerPadding
                            .copyWith(top: 0, bottom: 0, right: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: Constants.padding,
                            child: const Center(
                              child: CustomIcon(
                                Icons.favorite_border,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Accent Add to bag button
              Padding(
                padding: Constants.padding,
                child: buttons.CtaButton(
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIcon(
                        CupertinoIcons.bag_fill,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextSubHeadline(
                        text: 'Add to Bag',
                      ),
                    ],
                  ),
                ),
              ),

              // Apple Pay / Google Pay Button
              Padding(
                padding: Constants.padding.copyWith(top: 0),
                child: buttons.CtaButton(
                  color: Colors.black,
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIcon(
                        Icons.apple,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      TextSubHeadline(
                        text: 'Pay',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              // Share button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: Constants.padding,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: Constants.borderRadius,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: Constants.padding,
                            child: const Center(
                              child: CustomIcon(
                                CupertinoIcons.share,
                              ),
                            ),
                          ),
                          Padding(
                            padding: Constants.padding.copyWith(left: 0),
                            child: const TextBody(text: 'Share'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Description

              // Reviews and Feedback

              // Related Products

              const SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}
