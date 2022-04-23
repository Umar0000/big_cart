import 'dart:math' as math;

import 'package:big_cart/models/cataories_model/categories_model.dart';
import 'package:big_cart/models/item_models/item_model.dart';
import 'package:big_cart/screens/product_screen.dart';
import 'package:flutter/material.dart';

List<Item> list = [];

var catList = [
  CategoriesModel(
      id: 1,
      title: "Vegetable",
      imageUrl: "images/vegetable.svg",
      color: setRandomColor(),
      widget: ProductScreen(
        id: 1,
        title: "Vegetable",
      )),
  CategoriesModel(
      id: 2,
      title: "Fruit",
      imageUrl: "images/ic_apple.svg",
      color: setRandomColor(),
      widget: ProductScreen(
        id: 2,
        title: "Fruit",
      )),
  CategoriesModel(
      id: 3,
      title: "Beverages",
      imageUrl: "images/ic_beverage.svg",
      widget: ProductScreen(
        id: 3,
        title: "Beverages",
      ),
      color: setRandomColor()),
  CategoriesModel(
      id: 4,
      title: "Grocery",
      imageUrl: "images/ic_grocery.svg",
      widget: ProductScreen(
        id: 4,
        title: "Grocery",
      ),
      color: setRandomColor()),
  CategoriesModel(
      id: 5,
      title: "Edible Oil",
      imageUrl: "images/ic_oil.svg",
      widget: ProductScreen(
        id: 5,
        title: "Edible Oi",
      ),
      color: setRandomColor()),
  CategoriesModel(
      id: 6,
      title: "HouseHold",
      imageUrl: "images/ic_vacum.svg",
      widget: ProductScreen(
        id: 6,
        title: "HouseHold",
      ),
      color: setRandomColor()),
];

Color setRandomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(0.1);
}
