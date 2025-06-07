// lib/providers/ad_provider.dart
import 'package:flutter/material.dart';
import '../models/ad_model.dart';

class AdProvider with ChangeNotifier {
  List<AdModel> _ads = [];

  List<AdModel> get ads => _ads;

  void setAds(List<AdModel> newAds) {
    _ads = newAds;
    notifyListeners();
  }

  void addAd(AdModel ad) {
    _ads.insert(0, ad); // Insert at top
    notifyListeners();
  }

  void clearAds() {
    _ads.clear();
    notifyListeners();
  }
}
