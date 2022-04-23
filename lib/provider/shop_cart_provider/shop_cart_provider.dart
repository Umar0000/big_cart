import 'package:flutter/material.dart';

import '../../models/item_models/item_model.dart';

class ShopCartProvider extends ChangeNotifier {
  List<Item> list = [];

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
    list.removeAt(index);
  }

  late List<int> _counterList;

  set setCounter(int i) {
    _counterList.add(i);
  }

  int counter(int index) {
    return _counterList[index];
  }
}
