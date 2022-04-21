import 'package:fluttertoast/fluttertoast.dart';

void showToast(String value) => Fluttertoast.showToast(
    msg: value, gravity: ToastGravity.BOTTOM, fontSize: 15);
