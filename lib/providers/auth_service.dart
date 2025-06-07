// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/user.dart';

// class AuthService {
//   static const String baseUrl = 'http://10.0.2.2:8000'; // Your API base

//   Future<Map<String, dynamic>> login(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/api/login'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'password': password}),
//     );

//     if (response.statusCode == 200) {
//       final body = jsonDecode(response.body);
//       final token = body['token'];
//       final user = User.fromJson(body['user']);
//       return {'token': token, 'user': user};
//     } else {
//       throw Exception('Invalid credentials');
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class AuthService {
  static const String baseUrl = 'http://10.0.2.2:8000';

  // LOGIN
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/login'),
      headers: {'Accept': 'application/json'},
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return {
        'token': body['token'],
        'user': User.fromJson(body['user']),
      };
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error['message'] ?? 'Login failed');
    }
  }

  // REGISTER (NEW)
  static Future<Map<String, dynamic>> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/register'),
      headers: {'Accept': 'application/json'},
      body: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final body = jsonDecode(response.body);
      return {
        'token': body['token'],
        'user': User.fromJson(body['user']),
      };
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error['message'] ?? 'Registration failed');
    }
  }
}

