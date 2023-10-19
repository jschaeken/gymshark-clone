import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/components.dart/icon_components.dart';
import 'package:gymshark_clone/core/components.dart/layout.dart';
import 'package:gymshark_clone/core/components.dart/text_components.dart';
import 'package:gymshark_clone/domain/models/product.dart';
import 'package:gymshark_clone/domain/models/size.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key, required this.pageTitle});

  final String pageTitle;

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  late final String pageTitle;

  List<Product> bagItems = [
    Product(
      name: 'Aloe Vera Gel',
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
    ),
    Product(
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
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageTitle = widget.pageTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        HeaderRow(
          pageTitle: pageTitle,
          accountInitials: 'JS',
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              final isEmpty = bagItems.isNotEmpty;
              return isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIcon(
                            CupertinoIcons.bag_fill,
                            size: 100,
                            color: Theme.of(context).unselectedWidgetColor,
                          ),
                          const StandardSpacing(),
                          const TextHeadline(text: 'Your bag is empty'),
                          const StandardSpacing(),
                          TextBody(
                            text: 'Add some items to see them here',
                            color: Theme.of(context).unselectedWidgetColor,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: bagItems.length,
                      itemBuilder: (context, index) {
                        return null;
                      });
            },
          ),
        )
      ],
    ));
  }
}
