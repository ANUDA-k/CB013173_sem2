// class Property {
//   final int id;
//   final String topic;
//   final int rooms;
//   final int bathrooms;
//   final int price;
//   final String description;
//   final String imageUrl;
//   final String propertyType;

//   Property({
//     required this.id,
//     required this.topic,
//     required this.rooms,
//     required this.bathrooms,
//     required this.price,
//     required this.description,
//     required this.imageUrl,
//     required this.propertyType,
//   });

//   factory Property.fromJson(Map<String, dynamic> json) {
//     return Property(
//       id: json['id'],
//       topic: json['topic'],
//       rooms: json['rooms'],
//       bathrooms: json['bathrooms'],
//       price: json['price'],
//       description: json['description'],
//       imageUrl: json['images'][0], // Simplified for now
//       propertyType: json['property_type'],
//     );
//   }
// }
class Property {
  final int id;
  final String topic;
  final String rooms;
  final String bathrooms;
  final String price;
  final String description;
  final String contact;
  final String email;
  final String propertyType;
  final List<String> images;

  Property({
    required this.id,
    required this.topic,
    required this.rooms,
    required this.bathrooms,
    required this.price,
    required this.description,
    required this.contact,
    required this.email,
    required this.propertyType,
    required this.images,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      topic: json['topic'],
      rooms: json['rooms'].toString(),
      bathrooms: json['bathrooms'].toString(),
      price: json['price'].toString(),
      description: json['description'],
      contact: json['contact'],
      email: json['email'],
      propertyType: json['property_type'],
      images: json['images'] != null && json['images'].toString().isNotEmpty
          ? json['images'].toString().split(',')
          : [],
    );
  }
}

