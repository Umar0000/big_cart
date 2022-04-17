import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isHide = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool get isHide => _isHide;
  TextEditingController get email => _email;
  TextEditingController get password => _password;

  void showPassword() {
    _isHide = !_isHide;
    print("call");
    notifyListeners();
  }
}
