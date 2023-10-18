import 'package:flutter/cupertino.dart';
import 'package:gymshark_clone/core/components.dart/featured_brand_tile.dart';
import 'package:gymshark_clone/core/components.dart/product_tile.dart';
import 'package:gymshark_clone/core/components.dart/slim_text_tile.dart';
import 'package:gymshark_clone/core/components.dart/text_components.dart';
import 'package:gymshark_clone/presentation/pages/product_page.dart';

import '../../core/components.dart/multi_image_banner.dart';
import '../../core/constants.dart';
import '../../domain/models/product.dart';

class CategoryShop extends StatefulWidget {
  const CategoryShop({super.key, required this.id});

  final String id;

  @override
  State<CategoryShop> createState() => _CategoryShopState();
}

class _CategoryShopState extends State<CategoryShop> {
  List<String> promoImages = [
    'https://www.hereshealth.ie/cdn/shop/files/viridian2_614x350.jpg?v=1696405958',
    'https://www.hereshealth.ie/cdn/shop/files/ecoverzero2_592x364.jpg?v=1696405604',
    'https://www.hereshealth.ie/cdn/shop/files/hhbannerupdated_b9d83d32-e311-47fd-a402-7a2cd6f0a9c4_1227x725.jpg?v=1696499376%201.25x',
  ];

  List<List<String>> featuredBrandImages = [
    [
      'Veridian',
      'https://viridian-nutrition.com/cdn/shop/files/New_Website_Mobile_Banners-02.jpg?v=1689847168',
    ],
    [
      'A. Vogel',
      'https://www.avogel.com/img/client/startseite/slider/AVogel-Home-Slider-International.jpg?m=1532000218',
    ],
    [
      'Four Sigmatic',
      'https://images.ctfassets.net/x1qkutirh4di/5r5JvAoiBWPa09ACRpZ1gD/f626b668dde021f2f8eb4d7fa960c896/FS_Photoshoot_March2023_Day4-1509__1_.jpeg?w=768&fm=webp&q=75',
    ],
    [
      'Fabu U',
      'https://evergreen.ie/cdn/shop/collections/fabu.jpg?v=1696507601',
    ],
  ];

  List<Product> demoProducts = [
    Product(
      name: 'Optibac Immune Support',
      rating: Rating(
        average: 4.5,
        count: 100,
      ),
      variants: [
        ProductVariant(
          name: 'Optibac Immune Support Variant 1',
          imageUrls: [
            'https://picsum.photos/912',
            'https://picsum.photos/913',
          ],
          color: 'Red',
          isFavorite: false,
        ),
        ProductVariant(
          name: 'Optibac Immune Support Variant 2',
          imageUrls: [
            'https://picsum.photos/914',
            'https://picsum.photos/915',
          ],
          color: 'Blue',
          isFavorite: false,
        ),
      ],
      price: 500.00,
      description: 'Product 1 description',
      isFavorite: true,
    ),
    Product(
      name: 'Optibac Every Day',
      rating: Rating(
        average: 4,
        count: 100,
      ),
      variants: [
        ProductVariant(
          name: 'Optibac Every Day Variant 1',
          imageUrls: [
            'https://picsum.photos/912',
            'https://picsum.photos/913',
          ],
          color: 'Red',
          isFavorite: false,
        ),
        ProductVariant(
          name: 'Optibac Every Day Variant 2',
          imageUrls: [
            'https://picsum.photos/914',
            'https://picsum.photos/915',
          ],
          color: 'Blue',
          isFavorite: false,
        ),
      ],
      price: 50.00,
      description: 'Product 2 description',
      isFavorite: false,
    ),
    Product(
      name: 'Revive Active',
      rating: Rating(
        average: 3.2,
        count: 89,
      ),
      variants: [
        ProductVariant(
          name: 'Revive Active Variant 1',
          imageUrls: [
            'https://picsum.photos/912',
            'https://picsum.photos/913',
          ],
          color: 'Red',
          isFavorite: false,
        ),
        ProductVariant(
          name: 'Revive Active Variant 2',
          imageUrls: [
            'https://picsum.photos/914',
            'https://picsum.photos/915',
          ],
          color: 'Blue',
          isFavorite: false,
        ),
      ],
      price: 2000.00,
      description: 'Product 3 description',
      isFavorite: false,
    ),
    Product(
        name: 'Vital Proteins',
        rating: Rating(
          average: 6,
          count: 0,
        ),
        variants: [
          ProductVariant(
            name: 'Vital Proteins Variant 1',
            imageUrls: [
              'https://picsum.photos/912',
              'https://picsum.photos/913',
            ],
            color: 'Red',
            isFavorite: false,
          ),
          ProductVariant(
            name: 'Vital Proteins Variant 2',
            imageUrls: [
              'https://picsum.photos/914',
              'https://picsum.photos/915',
            ],
            color: 'Blue',
            isFavorite: false,
          ),
        ],
        price: 150.00,
        description: 'Product 4 description',
        isFavorite: true),
  ];

  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.37,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Promo PageView Header
          MultiImageBanner(images: promoImages),

          const SizedBox(
            height: 20,
          ),

          // Featured Products
          Padding(
            padding: Constants.padding.copyWith(bottom: 0),
            child: TextHeadline(text: 'Featured ${widget.id} Products'),
          ),

          SizedBox(
            height: 240,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              padEnds: false,
              controller: pageController,
              itemCount: demoProducts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return LargeProductTile(
                  product: demoProducts[index],
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(
                      builder: (context) {
                        return ProductPage(id: demoProducts[index].name);
                      },
                    ));
                  },
                  onFavoriteTap: () {},
                );
              },
            ),
          ),

          // Featured Brands Grid View Title
          Padding(
            padding: Constants.padding,
            child: TextHeadline(text: 'Featured ${widget.id} Brands'),
          ),
          // Featured Brands Grid View
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: Constants.padding.copyWith(top: 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.7,
              crossAxisSpacing: Constants.padding.right.abs(),
              mainAxisSpacing: Constants.padding.bottom.abs(),
            ),
            itemCount: featuredBrandImages.length,
            itemBuilder: (context, index) {
              return FeaturedBrandTile(brand: featuredBrandImages[index]);
            },
          ),
          //List of Product Categories Title
          Padding(
            padding: Constants.padding,
            child: const TextHeadline(text: 'Trending Categories'),
          ),

          // ListView of Product Categories
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return SlimTextTile(
                key: UniqueKey(),
                text: 'Category ${index + 1}',
                onTap: () {},
              );
            },
          )
        ],
      ),
    );
  }
}
