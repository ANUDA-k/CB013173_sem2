// lib/models/ad_model.dart
class AdModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  AdModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) {
    return AdModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      imageUrl: json['image_url'],
    );
  }
}
