
//comment this out if not workig 106pm
import 'package:flutter/material.dart';
import '../models/property.dart';
import '../services/property_service.dart';

class ExploreProvider extends ChangeNotifier {
  List<Property> _properties = [];
  bool _isLoading = false;
  String? _error;
  int _currentPage = 1;
  bool _hasMore = true;

  // Filters
  String? propertyType;
  String? location;
  int? minPrice;
  int? maxPrice;

  List<Property> get properties => _properties;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasMore => _hasMore;

  Future<void> fetchInitialProperties() async {
    _currentPage = 1;
    _hasMore = true;
    _properties = [];
    notifyListeners();
    await _fetchProperties();
  }

  Future<void> fetchMoreProperties() async {
    if (_isLoading || !_hasMore) return;
    _currentPage++;
    await _fetchProperties();
  }

  Future<void> _fetchProperties() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final newProperties = await PropertyService.fetchProperties(
        propertyType: propertyType,
        location: location,
        minPrice: minPrice,
        maxPrice: maxPrice,
        page: _currentPage,
      );

      if (newProperties.isEmpty) {
        _hasMore = false;
      }

      _properties.addAll(newProperties);
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  void updateFilters({
    String? newType,
    String? newLocation,
    int? newMinPrice,
    int? newMaxPrice,
  }) {
    propertyType = newType;
    location = newLocation;
    minPrice = newMinPrice;
    maxPrice = newMaxPrice;
    fetchInitialProperties();
  }
}
