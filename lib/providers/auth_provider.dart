import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _userEmail;
  bool _authenticated = false;
  bool _loading = false;
  String? _error;

  String? get userEmail => _userEmail;
  bool get authenticated => _authenticated;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> login(String email, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();
    // TODO: Replace with real authentication logic
    await Future.delayed(Duration(milliseconds: 800));
    if (email == 'admin@example.com' && password == 'password') {
      _userEmail = email;
      _authenticated = true;
    } else {
      _error = 'Invalid email or password.';
      _authenticated = false;
    }
    _loading = false;
    notifyListeners();
  }

  void logout() {
    _userEmail = null;
    _authenticated = false;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
