import 'package:big_cart/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class DrawerProvider extends ChangeNotifier {
  final advancedDrawerController = AdvancedDrawerController();
  handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible()
    // ;
    advancedDrawerController.showDrawer();
  }

  Screen _screenName = Screen.HomeScreen;

  Screen get screnName => _screenName;

  void screenName(Screen value) {
    _screenName = value;
    notifyListeners();
  }
}
