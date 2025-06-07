import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/property.dart';

class PropertyService {
  static Future<List<Property>> fetchProperties({
    String? propertyType,
    String? location,
    int? minPrice,
    int? maxPrice,
    int page = 1,
  }) async {
    final queryParams = {
      'property_type': propertyType,
      'location': location,
      'min_price': minPrice?.toString(),
      'max_price': maxPrice?.toString(),
      'page': page.toString(),
    }..removeWhere((_, v) => v == null);

    final uri = Uri.http('127.0.0.1:8000', '/api/properties', queryParams);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      return data.map((e) => Property.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch properties');
    }
  }
}
