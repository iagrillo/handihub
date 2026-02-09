import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier {
  double? _latitude;
  double? _longitude;
  bool _loading = false;
  String? _error;

  double? get latitude => _latitude;
  double? get longitude => _longitude;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> setLocation(double lat, double lon) async {
    _loading = true;
    _error = null;
    notifyListeners();
    // Simulate a delay for location update
    await Future.delayed(Duration(milliseconds: 500));
    _latitude = lat;
    _longitude = lon;
    _loading = false;
    notifyListeners();
  }

  void clear() {
    _latitude = null;
    _longitude = null;
    notifyListeners();
  }

  void setError(String error) {
    _error = error;
    notifyListeners();
  }
}
