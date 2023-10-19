class Review {
  final String id;
  final String title;
  final String description;
  final String author;
  final DateTime date;
  final double rating;

  Review({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.date,
    required this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    // failsafe for null values
    return Review(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      author: json['author'] ?? '',
      date: json['date'] ?? DateTime.now(),
      rating: json['rating'] ?? 0.0,
    );
  }
}
