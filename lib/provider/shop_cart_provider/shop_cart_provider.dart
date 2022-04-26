import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../models/item_models/item_model.dart';

class ShopCartProvider extends ChangeNotifier {
  List<Item> list = [];
  late Color _colors;
  int _price = 0;
  void setPrice(int price) {
    _price += price;
    print(_price);
    notifyListeners();
  }

  void setInitPrice() {
    _price = 0;
  }

  void setMinusPrice(int price) {
    if (_price > 0) {
      _price -= price;
    } else {
      _price = 0;
    }
    notifyListeners();
  }

  // void setMinusTotalPrice(int price) {
  //   if (list.length == 1) {
  //     _totalPrice = 0;
  //   } else {
  //     _totalPrice -= _price;
  //   }
  //   notifyListeners();
  // }

  get price => _price;
  // get totalPrice => _totalPrice;
  Item getListItem(index) {
    return list[index];
  }

  void listAdd(Item item) {
    list.add(item);
    notifyListeners();
  }

  void updateList(int index, Item item) {
    list[index] = item;
    notifyListeners();
  }

  void removeItem(int index) {
    print(list[index]);
    list.removeAt(index);
    notifyListeners();
  }

  void setColor() {
    _colors =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.1);
  }

  get colors => _colors;
}
