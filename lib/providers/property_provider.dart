//this is new
import 'package:flutter/material.dart';
import '../models/property_model.dart';

class PropertyProvider with ChangeNotifier {
  final List<Property> _properties = [];

  List<Property> get properties => _properties;

  void addProperty(Property property) {
    _properties.add(property);
    notifyListeners();
  }
}
