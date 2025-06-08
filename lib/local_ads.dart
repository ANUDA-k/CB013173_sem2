import 'models/property.dart';

class LocalAds {
  static final LocalAds _instance = LocalAds._internal();

  factory LocalAds() {
    return _instance;
  }

  LocalAds._internal();

  final List<Property> _ads = [];

  List<Property> get ads => _ads;

  void addAd(Property ad) {
    _ads.add(ad);
  }

  void clear() {
    _ads.clear();
  }
}