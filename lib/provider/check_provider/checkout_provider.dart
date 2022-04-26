import 'dart:convert';
import 'dart:io';

import 'package:big_cart/models/item_models/item_model.dart';
import 'package:big_cart/utils/golbal_function_veriables.dart';
import 'package:big_cart/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../screens/success_screen.dart';
import '../../utils/golbal_function_veriables.dart';
import '../../utils/url.dart';

class CheckOutProvider extends ChangeNotifier {
  final TextEditingController _name = TextEditingController(text: "Umar");
  final TextEditingController _email =
      TextEditingController(text: "Umara@gmail.com");
  final TextEditingController _phone =
      TextEditingController(text: "0313-88554561");
  final TextEditingController _address =
      TextEditingController(text: "nazimabad");
  final TextEditingController _zipCode = TextEditingController(text: "123");
  final TextEditingController _city = TextEditingController(text: "khi");
  final TextEditingController _country = TextEditingController(text: "pk");

  TextEditingController get name => _name;

  TextEditingController get email => _email;

  TextEditingController get phone => _phone;

  TextEditingController get address => _address;

  TextEditingController get zipCode => _zipCode;

  TextEditingController get city => _city;

  TextEditingController get country => _country;

  void createOrder(List<Item> list, BuildContext context) async {
    var user = await getUser();
    var list2 = <dynamic>[];
    var map = <String, dynamic>{};
    for (var e in list) {
      map["id"] = e.id;
      map["catId"] = e.catId;
      map["title"] = e.title;
      map["unit"] = e.unit;
      map["stockAvailable"] = e.stock;
      map["image"] = e.imageUrl;
      map["price"] = e.price;
      map["qty"] = e.qty;
      list2.add(map);
    }
    var json = jsonEncode(list2);
    print(json);
    var body = {
      "name": _name.text,
      "email": _email.text,
      "phoneNumber": _phone.text,
      "address": _address.text,
      "zip": _zipCode.text,
      "city": _city.text,
      "country": _country.text,
      "items": json,
    };
    http.Response response = await http.post(
      Uri.parse(Url.CREATE_ORDER),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: user.accessToken!,
      },
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      pushName(context, const SuccessScreen());
    } else {
      showToast(response.reasonPhrase.toString());
    }
  }
}
