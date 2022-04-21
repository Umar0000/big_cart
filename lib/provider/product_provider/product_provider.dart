import 'dart:convert';

import 'package:big_cart/models/cataories_model/cat_model_one/categories_model_one.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class ProductProvider extends ChangeNotifier {
  Future<CategoriesModelOne> getCategories(int? id) async {
    var request = http.Request('GET', Uri.parse('${Url.CATEGORIE_URL}$id'));
    http.StreamedResponse response = await request.send();
    return CategoriesModelOne.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }
}
