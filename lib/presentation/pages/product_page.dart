import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gymshark_clone/core/components.dart/buttons.dart' as buttons;
import 'package:gymshark_clone/core/components.dart/custom_shapes.dart';
import 'package:gymshark_clone/core/components.dart/icon_components.dart';
import 'package:gymshark_clone/core/components.dart/layout.dart';
import 'package:gymshark_clone/core/components.dart/text_components.dart';
import 'package:gymshark_clone/core/components.dart/variant_scrollable.dart';
import 'package:gymshark_clone/domain/models/product.dart';
import 'package:gymshark_clone/domain/models/review.dart';
import 'package:gymshark_clone/domain/models/size.dart';

import '../../core/components.dart/image_gallery.dart';
import '../../core/constants.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({required this.id, super.key});

  final String id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selectedVariantIndex = 0;
  int imageIndex = 0;
  Size? selectedSize;
  bool overlayAddToBag = false;

  final ScrollController scrollController = ScrollController();

  // DEMO DATA START

  final List<Review> reviews = [
    Review(
      id: '1',
      rating: 4.3,
      title: 'Great product',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, eget aliquam nisl nunc eget nisl. Quisque euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, eget aliquam nisl nunc eget nisl.',
      author: 'John Smith',
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  final Product product = Product(
    name: 'A. Vogel Echinaforce',
    isFavorite: false,
    description:
        """A long description of the product. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, eget aliquam nisl nunc eget nisl. Quisque euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, eget aliquam nisl nunc eget nisl. Quisque euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, eget aliquam nisl nunc eget nisl.

Quisque euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, eget aliquam nisl nunc eget nisl. Quisque euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, eget aliquam nisl nunc eget nisl. Quisque euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, eget aliquam nisl nunc eget nisl. Quisque euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, eget aliquam nisl nunc eget nisl. Quisque euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, eget aliquam nisl nunc eget nisl.""",
    rating: Rating(
      average: 3.6,
      count: 100,
    ),
    variants: [
      ProductVariant(
        sizes: [
          Size.s,
          Size.m,
          Size.l,
          Size.xl,
          Size.xxl,
        ],
        price: 100,
        name: 'Variant 1',
        imageUrls: [
          'https://abclive1.s3.amazonaws.com/1a901430-9efa-45a3-acc9-316f439be1ee/productimage/WHLV085___L.jpg',
          'https://picsum.photos/913',
        ],
        color: 'Red',
        isFavorite: false,
      ),
      ProductVariant(
        sizes: [
          Size.s,
          Size.m,
          Size.l,
          Size.xl,
          Size.xxl,
        ],
        price: 150,
        name: 'Variant 2',
        imageUrls: [
          'https://picsum.photos/914',
          'https://picsum.photos/915',
        ],
        color: 'Blue',
        isFavorite: false,
      ),
      ProductVariant(
        sizes: [
          Size.s,
          Size.m,
          Size.l,
          Size.xl,
          Size.xxl,
        ],
        price: 200,
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

  PageController imageController = PageController(
    initialPage: 0,
    viewportFraction: 1,
  );

  // DEMO DATA END

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
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
              ScrollDirection.forward &&
          !overlayAddToBag &&
          scrollController.offset > 70) {
        setState(() {
          overlayAddToBag = true;
        });
      } else if (overlayAddToBag &&
          (scrollController.position.userScrollDirection ==
                  ScrollDirection.reverse ||
              scrollController.offset < 70)) {
        setState(() {
          overlayAddToBag = false;
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
            child: const CustomIcon(
              Icons.arrow_back_ios_new_rounded,
              size: 22,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
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

                  const StandardSpacing(),
                  // Product Details
                  Padding(
                    padding: Constants.padding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Name and price row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextBody(text: product.name),
                            TextSubHeadline(
                              text:
                                  '€${product.variants[selectedVariantIndex].price.toStringAsFixed(2)}',
                            ),
                          ],
                        ),

                        const StandardSpacing(
                          multiplier: 0.5,
                        ),
                        //Variant Name
                        TextBody(
                            text: product.variants[selectedVariantIndex].name,
                            color: Theme.of(context).unselectedWidgetColor),

                        const StandardSpacing(
                          multiplier: 0.5,
                        ),

                        //Color
                        TextBody(
                          text: product.variants[selectedVariantIndex].color,
                          color: Theme.of(context).unselectedWidgetColor,
                        ),

                        const StandardSpacing(multiplier: 2),

                        // Reviews by stars
                        Row(
                          children: [
                            for (int i = 0; i < 5; i++)
                              Padding(
                                padding:
                                    Constants.innerPadding.copyWith(left: 0),
                                child: product.rating.average.toInt() > i
                                    ? const CustomIcon(
                                        Icons.star,
                                        size: 14,
                                      )
                                    :
                                    //Mask over the star to show 10ths of a star
                                    CustomStar(
                                        size: 14,
                                        fillAmount:
                                            product.rating.average - i > 0
                                                ? product.rating.average - i
                                                : 0,
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

                        const StandardSpacing(multiplier: 2),

                        // Select Size Title and Size Guide
                        Row(
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
                                    CupertinoIcons.info_circle,
                                    color: Theme.of(context).primaryColor,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const TextBody(
                                    text: 'Size Guide',
                                    decoration: TextDecoration.underline,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const StandardSpacing(),

                        // Size Selector and favorite button
                        Row(
                          children: [
                            Flexible(
                              flex: 4,
                              child: Padding(
                                padding: Constants.innerPadding
                                    .copyWith(top: 0, bottom: 0, left: 0),
                                child: buttons.DropdownButton(
                                  text: product.variants[selectedVariantIndex]
                                              .sizes !=
                                          null
                                      ? selectedSize == null
                                          ? 'Select Size'
                                          : selectedSize!.name
                                      : 'One Size',
                                  onTap: () async {
                                    if (product.variants[selectedVariantIndex]
                                            .sizes !=
                                        null) {
                                      var res = await showSizeModal(
                                        product.name,
                                        product.variants[selectedVariantIndex],
                                      );
                                      setNewSize(res);
                                    }
                                  },
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
                                  child: const Padding(
                                    padding: EdgeInsets.all(9),
                                    child: Center(
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

                        const StandardSpacing(
                          multiplier: 2,
                        ),

                        // Accent Add to bag button
                        buttons.CtaButton(
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

                        const StandardSpacing(),

                        // Apple Pay / Google Pay Button
                        buttons.CtaButton(
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

                        const StandardSpacing(multiplier: 4),

                        // Share button
                        Center(
                          child: buttons.CtaButton(
                            width: 120,
                            color: Theme.of(context).cardColor,
                            onTap: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: CustomIcon(
                                    CupertinoIcons.share,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                TextBody(text: 'Share'),
                              ],
                            ),
                          ),
                        ),

                        const StandardSpacing(multiplier: 2),

                        // Description
                        const TextSubHeadline(
                          text: 'Description',
                        ),
                        TextBody(
                          text: product.description,
                        ),

                        const StandardSpacing(
                          multiplier: 2,
                        ),

                        // Material
                        const TextSubHeadline(
                          text: 'Material',
                        ),
                        const TextBody(
                          text: '100% Cotton',
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: Constants.padding,
                    child: const Divider(),
                  ),

                  // Reviews and Feedback
                  Column(
                    children: [
                      Padding(
                        padding: Constants.padding,
                        child: const Center(
                          child: TextSubHeadline(
                            text: 'Reviews and Feedback',
                          ),
                        ),
                      ),
                      TextMassive(text: product.rating.average.toString()),
                      //Stars
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding: Constants.innerPadding.copyWith(left: 0),
                              child: product.rating.average.toInt() > i
                                  ? const CustomIcon(
                                      Icons.star,
                                      size: 45,
                                    )
                                  :
                                  //Mask over the star to show 10ths of a star
                                  CustomStar(
                                      fillAmount: product.rating.average - i > 0
                                          ? product.rating.average - i
                                          : 0,
                                    ),
                            ),
                        ],
                      ),

                      Padding(
                        padding: Constants.padding,
                        child: TextHeadline(
                          text: 'Based on ${product.rating.count} reviews',
                        ),
                      ),

                      Padding(
                        padding: Constants.padding,
                        child: const TextBody(
                          text: 'All reviews are written by verified buyers',
                        ),
                      ),

                      // Review Cards
                      for (int i = 0; i < reviews.length; i++)
                        Padding(
                            padding: Constants.padding,
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: Constants.borderRadius,
                              ),
                              child: Padding(
                                padding: Constants.padding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Rating
                                    Row(
                                      children: [
                                        for (int j = 0; j < 5; j++)
                                          product.rating.average.toInt() > i
                                              ? const CustomIcon(
                                                  Icons.star,
                                                  size: 20,
                                                )
                                              :

                                              //Mask over the star to show 10ths of a star
                                              CustomStar(
                                                  size: 20,
                                                  fillAmount: product.rating
                                                                  .average -
                                                              i >
                                                          0
                                                      ? product.rating.average -
                                                          i
                                                      : 0,
                                                ),
                                        Padding(
                                          padding: Constants.innerPadding,
                                          child: TextBody(
                                            text: '${reviews[i].rating}',
                                          ),
                                        ),
                                      ],
                                    ),

                                    const StandardSpacing(),

                                    // Title
                                    TextBody(
                                      text: reviews[i].title,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    const StandardSpacing(),

                                    // Description
                                    TextBody(
                                      text: reviews[i].description,
                                    ),

                                    const StandardSpacing(),

                                    // Author and Date
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextBody(
                                          text: reviews[i].author,
                                          color: Theme.of(context)
                                              .unselectedWidgetColor,
                                        ),
                                        TextBody(
                                          text: '${reviews[i].date.day} '
                                              '${Constants.months[reviews[i].date.month - 1]} '
                                              '${reviews[i].date.year}',
                                          color: Theme.of(context)
                                              .unselectedWidgetColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                    ],
                  ),

                  // Related Products

                  const SizedBox(
                    height: 200,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Future<Size?> showSizeModal(
      String productName, ProductVariant productVariant) async {
    return await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: Constants.borderRadius.copyWith(
              bottomLeft: const Radius.circular(0),
              bottomRight: const Radius.circular(0),
            ),
          ),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: Constants.padding,
                child: SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Image.network(
                          productVariant.imageUrls[0],
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: Constants.padding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: Constants.innerPadding,
                                child: TextSubHeadline(text: productName),
                              ),
                              Padding(
                                padding: Constants.innerPadding,
                                child: TextBody(text: productVariant.name),
                              ),
                              Padding(
                                padding: Constants.innerPadding,
                                child: TextSubHeadline(
                                    text:
                                        '€${productVariant.price.toStringAsFixed(2)}'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: Constants.padding,
                child: const TextHeadline(text: 'Select Size'),
              ),
              ListView.builder(
                padding: Constants.padding.copyWith(top: 0, bottom: 0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: productVariant.sizes!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                    color: Colors.transparent,
                    child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: Constants.borderRadius,
                        ),
                        onTap: () {
                          Navigator.pop(context, productVariant.sizes![index]);
                        },
                        title: TextBody(
                          text: productVariant.sizes![index].name,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: Constants.padding.copyWith(left: 0),
                              child: const TextSubHeadline(
                                text: 'Select',
                              ),
                            ),
                            const CustomIcon(
                              Icons.add_circle_outline_rounded,
                            ),
                          ],
                        )),
                  );
                },
              )
            ]),
          ),
        );
      },
    );
  }

  void setNewSize(Size? res) {
    if (res != null) {
      setState(() {
        selectedSize = res;
      });
    }
  }
}
