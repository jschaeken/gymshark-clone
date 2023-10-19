import 'package:gymshark_clone/domain/models/size.dart';

class Product {
  String name;
  String description;
  bool isFavorite;
  List<ProductVariant> variants;
  Rating rating;

  Product({
    required this.name,
    required this.description,
    required this.isFavorite,
    required this.variants,
    required this.rating,
  });
}

class Rating {
  double average;
  int count;

  Rating({
    required this.average,
    required this.count,
  });
}

class ProductVariant {
  String name;
  String color;
  bool isFavorite;
  double price;
  List<String> imageUrls;
  List<Size>? sizes;

  ProductVariant({
    required this.name,
    required this.color,
    required this.isFavorite,
    required this.imageUrls,
    required this.price,
    this.sizes,
  });
}
