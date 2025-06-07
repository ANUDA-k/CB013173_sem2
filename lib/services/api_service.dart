// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static const String baseUrl = 'http://10.0.2.2:8000/api'; // for Android emulator

//   static Future<http.Response> post(String endpoint, Map<String, dynamic> data, {String? token}) {
//     return http.post(
//       Uri.parse('$baseUrl/$endpoint'),
//       body: jsonEncode(data),
//       headers: {
//         'Content-Type': 'application/json',
//         if (token != null) 'Authorization': 'Bearer $token',
//       },
//     );
//   }

//   static Future<http.Response> get(String endpoint, {String? token}) {
//     return http.get(
//       Uri.parse('$baseUrl/$endpoint'),
//       headers: {
//         'Accept': 'application/json',
//         if (token != null) 'Authorization': 'Bearer $token',
//       },
//     );
//   }

  
// }

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import '../models/property.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000/api'; // for Android emulator

  static Future<http.Response> post(String endpoint, Map<String, dynamic> data, {String? token}) {
    return http.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );
  }

  static Future<http.Response> get(String endpoint, {String? token}) {
    return http.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );
  }

  
  static Future<List<Property>> fetchProperties() async {
    try {
      final response = await get('sale'); // Adjust if your route is different
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body)['data'];
        return jsonData.map((item) => Property.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load from API');
      }
    } catch (_) {
      // Fallback to local data (optional)
      final localData = await rootBundle.loadString('assets/local_sales.json');
      final List<dynamic> fallbackData = jsonDecode(localData);
      return fallbackData.map((item) => Property.fromJson(item)).toList();
    }
  }
}


