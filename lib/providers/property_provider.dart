//this is new
import 'package:flutter/material.dart';
import '../models/property_model.dart';

class PropertyProvider with ChangeNotifier {
  final List<PropertyModel> _localProperties = [];

  List<PropertyModel> get localProperties => _localProperties;

  void addLocalProperty(PropertyModel property) {
    _localProperties.insert(0, property);
    notifyListeners();
  }
}
