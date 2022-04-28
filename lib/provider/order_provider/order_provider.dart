import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/order_model/order_model.dart';
import '../../utils/golbal_function_veriables.dart';
import '../../utils/url.dart';

class OrderProvider extends ChangeNotifier {
  int _totalPrice = 0;
  Future<List<OrderData>?> getAllProduct() async {
    var user = await getUser();
    print(user.accessToken);
    var request = http.get(
      Uri.parse(Url.CREATE_ORDER),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: user.accessToken!,
      },
    );
    var response = await request;
    var product = OrderModel.fromJson(jsonDecode(response.body));
    product.data?.forEach((e) {
      e.items?.forEach((element) {
        // setListPrice(element.price?.toInt());
      });
    });
    print("price ${_totalPrice}");
    return product.data;
  }

  void setListPrice(int? price) {
    if (price != null) {
      _totalPrice += price;
      print("price ${_totalPrice}");
      notifyListeners();
    }
  }

  int get getTotalPrice => _totalPrice;
}
