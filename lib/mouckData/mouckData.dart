import 'dart:math' as math;

import 'package:big_cart/models/cataories_model/categories_model.dart';
import 'package:big_cart/models/item_models/item_model.dart';
import 'package:big_cart/screens/product_screen.dart';
import 'package:flutter/material.dart';

List<Item> list = [
  Item(
      imageUrl: "images/ic_broccoli.png",
      price: "\$2.22",
      title: "Fresh Broccoli",
      calories: "1.50 lbs"),
  Item(
      imageUrl: "images/im.png",
      price: "\$40",
      title: "Avacoda",
      calories: "1.50 lbs"),
  Item(
      imageUrl: "images/im.png",
      price: "\$2.22 x 4",
      title: "Grapes",
      calories: "1.50 lbs"),
  Item(
      imageUrl: "images/im.png",
      price: "\$2.22 x 4",
      title: "Pineapple",
      calories: "1.50 lbs"),
  Item(
      imageUrl: "images/im.png",
      price: "\$2.22 x 4",
      title: "Pineapple",
      calories: "1.50 lbs"),
  Item(
      imageUrl: "images/im.png",
      price: "\$2",
      title: "Pineapple",
      calories: "1.50 lbs"),
  Item(
      imageUrl: "images/im.png",
      price: "\$90",
      title: "Pineapple",
      calories: "1.50 lbs"),
  Item(
      imageUrl: "images/ic_broccoli.png",
      price: "\$50",
      title: "Pineapple",
      calories: "1.50 lbs"),
  Item(
      imageUrl: "images/ic_broccoli.png",
      price: "\$60",
      title: "Pineapple",
      calories: "1.50 lbs"),
];

var catList = [
  CategoriesModel(
      title: "Vegetable",
      imageUrl: "images/vegetable.svg",
      color: setRandomColor(),
      widget: ProductScreen(
        title: "Vegetable",
      )),
  CategoriesModel(
      title: "Fruit",
      imageUrl: "images/ic_apple.svg",
      color: setRandomColor(),
      widget: ProductScreen(
        title: "Fruit",
      )),
  CategoriesModel(
      title: "Beverages",
      imageUrl: "images/ic_beverage.svg",
      widget: ProductScreen(
        title: "Beverages",
      ),
      color: setRandomColor()),
  CategoriesModel(
      title: "Grocery",
      imageUrl: "images/ic_grocery.svg",
      widget: ProductScreen(
        title: "Grocery",
      ),
      color: setRandomColor()),
  CategoriesModel(
      title: "Edible Oil",
      imageUrl: "images/ic_oil.svg",
      widget: ProductScreen(
        title: "Edible Oi",
      ),
      color: setRandomColor()),
  CategoriesModel(
      title: "HouseHold",
      imageUrl: "images/ic_vacum.svg",
      widget: ProductScreen(
        title: "HouseHold",
      ),
      color: setRandomColor()),
];

Color setRandomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(0.1);
}
