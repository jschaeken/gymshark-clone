class Product {
  String name;
  double price;
  String description;
  bool isFavorite;
  List<ProductVariant> variants;
  Rating rating;

  Product({
    required this.name,
    required this.price,
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
  List<String> imageUrls;

  ProductVariant({
    required this.name,
    required this.color,
    required this.isFavorite,
    required this.imageUrls,
  });
}
