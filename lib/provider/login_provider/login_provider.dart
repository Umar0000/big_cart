import 'dart:convert';

import 'package:big_cart/models/login_response/login_response.dart';
import 'package:big_cart/models/login_response/user.dart';
import 'package:big_cart/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/golbal_function_veriables.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void saveUser(Data? user) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("email", user?.email ?? "null");
    prefs.setInt("id", user?.id ?? 0);
    prefs.setString("phone", user?.email ?? "null");
    prefs.setString("token", user?.accessToken ?? "null");
  }

  Data? user;

  Future<String> sendLoginRegistrationRequest(
      bool isRegistration, String email, String password,
      {String phone = ""}) async {
    isLoading = true;
    var request;
    if (isRegistration) {
      request = http.MultipartRequest('POST', Uri.parse(Url.Registration_URL));
      request.fields
          .addAll({'email': email, 'password': password, 'phone': phone});
    } else {
      request = http.MultipartRequest('POST', Uri.parse(Url.Login_URL));
      request.fields.addAll({'email': email, 'password': password});
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var loginResponse = LoginResponse.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      user = loginResponse.data;
      saveUser(user);
      isLoading = false;
      notifyListeners();
      return loginResponse.message.toString();
    } else {
      isLoading = false;
      notifyListeners();
      showToast(response.reasonPhrase.toString());

      return response.reasonPhrase.toString();
    }
  }

  bool _isHide = true;

  bool get isHide => _isHide;

  void showPassword() {
    _isHide = !_isHide;
    notifyListeners();
  }

  bool isLoading = false;
}
