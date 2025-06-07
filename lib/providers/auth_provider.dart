// import 'package:flutter/material.dart';
// import '../models/user.dart';
// import '../providers/auth_service.dart';

// class AuthProvider with ChangeNotifier {
//   User? _user;
//   String? _token;
//   final _authService = AuthService();

//   User? get user => _user;
//   bool get isAuthenticated => _user != null;

//   // Add this getter to use _token
//   String? get token => _token;

//   Future<void> login(String email, String password) async {
//     final result = await _authService.login(email, password);
//     _user = result['user'];
//     _token = result['token'];
//     notifyListeners();
//   }

//   void logout() {
//     _user = null;
//     _token = null;
//     notifyListeners();
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../providers/auth_service.dart'; // Adjusted import path if needed

class AuthProvider with ChangeNotifier {
  User? _user;
  String? _token;

  User? get user => _user;
  String? get token => _token;
  bool get isAuthenticated => _token != null;

  // LOGIN
  Future<void> login(String email, String password) async {
    final result = await AuthService.login(email, password); // ✅ Static call
    _token = result['token'];
    _user = result['user'];
    await _saveUserData(_token!, _user!);
    notifyListeners();
  }

  // REGISTER
  Future<void> register(String name, String email, String password) async {
    final result = await AuthService.register(name, email, password); // ✅ Static call
    _token = result['token'];
    _user = result['user'];
    await _saveUserData(_token!, _user!);
    notifyListeners();
  }

  // LOGOUT
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _token = null;
    _user = null;
    notifyListeners();
  }

  // SAVE to SharedPreferences
  Future<void> _saveUserData(String token, User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('user', jsonEncode(user.toJson())); // ✅ requires toJson() in User
  }

  // LOAD from SharedPreferences (on app start)
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final userJson = prefs.getString('user');

    if (token != null && userJson != null) {
      _token = token;
      _user = User.fromJson(jsonDecode(userJson));
      notifyListeners();
    }
  }
}
