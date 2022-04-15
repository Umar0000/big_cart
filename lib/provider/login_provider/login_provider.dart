import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isHide = false;

  bool get isHide => _isHide;

  void showPassword() {
    _isHide = !_isHide;
    print("call");
    notifyListeners();
  }
}
