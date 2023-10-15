class Product {
  String name;
  List<String> imageUrls;
  double price;
  String description;
  bool isFavorite;

  Product({
    required this.name,
    required this.imageUrls,
    required this.price,
    required this.description,
    required this.isFavorite,
  });
}
