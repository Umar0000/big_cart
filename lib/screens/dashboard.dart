import 'package:big_cart/provider/drawe_provider/drawer_provider.dart';
import 'package:big_cart/screens/home_screen.dart';
import 'package:big_cart/screens/order_screen.dart';
import 'package:big_cart/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';

import '../utils/enums.dart';
import '../widgets/drawer_layout_widget/drawer_layout.dart';

class Dashboard extends StatelessWidget {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var provider = Provider.of<DrawerProvider>(context, listen: false);
      return AdvancedDrawer(
        backdropColor: green,
        controller: provider.advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: provider.screnName == Screen.HomeScreen
            ? HomeScreen()
            : OrderScreen(),
        drawer: DraweLayoutWidget(),
      );
    });
  }
}
