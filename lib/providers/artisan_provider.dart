import 'package:flutter/material.dart';
import '../features/models/artisan.dart';
import '../features/utils/storage.dart';

class ArtisanProvider extends ChangeNotifier {
  List<Artisan> _artisans = [];
  bool _loading = false;
  String? _error;

  List<Artisan> get artisans => _artisans;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> loadArtisans() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _artisans = await StorageUtils.getArtisans();
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> addArtisan(Artisan artisan) async {
    _loading = true;
    notifyListeners();
    try {
      await StorageUtils.addArtisan(artisan);
      _artisans.add(artisan);
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void clear() {
    _artisans = [];
    notifyListeners();
  }
}
