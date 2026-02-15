class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // Support alternate keys coming from assets/data.json (e.g. "cost" and "image")
    final rawImage = json["imageUrl"] ?? json["image"] ?? '';
    String imageUrl = rawImage ?? '';
    if (imageUrl.isNotEmpty && !imageUrl.contains('.')) {
      imageUrl = '$imageUrl.png';
    }

    return User(
      id: json["id"] ?? 0,
      name: json["name"] ?? '',
      email: json["email"] ?? '',
      // Some JSON uses "phone" and some (assets) use "cost" — keep whichever is present
      phone: json["phone"]?.toString() ?? json["cost"]?.toString() ?? '',
      imageUrl: imageUrl,
    );
  }
}
