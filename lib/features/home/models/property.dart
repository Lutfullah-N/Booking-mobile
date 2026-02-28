class Property {
  final String imageUrl;
  final String title;
  final String location;
  final String price;
  final double rating;
  final bool isComingSoon;
  Property({
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.isComingSoon
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
        imageUrl: json['ImageUrl'],
        title: json['title'],
        location: json['location'],
        price: json['price'],
        isComingSoon: json['isComingSoon'],
        rating: (json['rating'] as num).toDouble());
  }
}
