class Sale {
  final int id;
  final String topic;
  final int rooms;
  final int bathrooms;
  final String price;
  final String description;
  final String contact;
  final String email;
  final String propertyType;
  final List<String> images;

  Sale({
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

  factory Sale.fromJson(Map<String, dynamic> json) {
    return Sale(
      id: json['id'],
      topic: json['topic'],
      rooms: json['rooms'],
      bathrooms: json['bathrooms'],
      price: json['price'],
      description: json['description'],
      contact: json['contact'],
      email: json['email'],
      propertyType: json['property_type'],
      images: json['images'].toString().split(','),
    );
  }
}
