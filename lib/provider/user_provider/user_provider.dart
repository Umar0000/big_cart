import 'package:big_cart/models/login_response/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late Data _user;

  set setUser(Data user) {
    _user = user;
    notifyListeners();
  }

  get user => _user;
}
