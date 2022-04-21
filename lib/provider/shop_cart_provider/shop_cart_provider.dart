import 'package:flutter/material.dart';

class ShopCartProvider extends ChangeNotifier {
  late List<int> _counterList;

  set setCounter(int i) {
    _counterList.add(i);
  }

  int counter(int index) {
    return _counterList[index];
  }
}
