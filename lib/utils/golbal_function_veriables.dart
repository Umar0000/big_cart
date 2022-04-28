import 'package:big_cart/utils/route_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_response/user.dart';

void showToast(String value) => Fluttertoast.showToast(
    msg: value, gravity: ToastGravity.BOTTOM, fontSize: 15);

Future<Data> getUser() async {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  return Data(
      id: prefs.getInt("id"),
      phone: prefs.getString("phone"),
      accessToken: prefs.getString("token"),
      email: prefs.getString("email"));
}

void logout(BuildContext context) async {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  prefs.clear();

  Navigator.pushNamedAndRemoveUntil(context, LoginPath, (route) => false);
}

void pushReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
    context,
    PageTransition(
        duration: const Duration(milliseconds: 800),
        type: PageTransitionType.leftToRight,
        child: widget),
  );
}

void pushName(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    PageTransition(
        duration: const Duration(milliseconds: 800),
        type: PageTransitionType.leftToRight,
        child: widget),
  );
}
