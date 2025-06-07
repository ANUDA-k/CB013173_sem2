//this is new
class PropertyModel {
  final String title;
  final String description;
  final String price;
  final String location;
  final String category;
  final List<String> imagePaths;

  PropertyModel({
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.category,
    required this.imagePaths,
  });
}
