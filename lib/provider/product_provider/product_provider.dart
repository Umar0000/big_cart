import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:big_cart/models/product_model/product_model.dart';
import 'package:big_cart/utils/golbal_function_veriables.dart';
import 'package:big_cart/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  Future<List<ProductData>?> getAllProduct() async {
    var user = await getUser();
    print(user.accessToken);
    var request = http.get(
      Uri.parse(Url.ALL_PRODUCT),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: user.accessToken!,
      },
    );
    var response = await request;
    var product = ProductModel.fromJson(jsonDecode(response.body));
    return product.data;
  }

  Future<List<ProductData>?> getSearch(String search) async {
    var user = await getUser();
    print(user.accessToken);
    var request = http.get(
      Uri.parse("${Url.ALL_PRODUCT}/search?q=$search"),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: user.accessToken!,
      },
    );
    var response = await request;
    var product = ProductModel.fromJson(jsonDecode(response.body));
    print(response.body.toString());
    return product.data;
  }

  final List<int> badgesList = [];
  void addBadge(int value) {
    badgesList.add(value);
    notifyListeners();
  }

  void removeBadgeitem(int index) {
    badgesList.removeAt(index);
    notifyListeners();
  }
}
