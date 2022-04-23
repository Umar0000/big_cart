import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../provider/shop_cart_provider/shop_cart_provider.dart';
import '../../screens/shop_cart_screen.dart';
import '../../utils/styles.dart';

class CardFloatingBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider2 = Provider.of<ShopCartProvider>(context, listen: true);
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            PageTransition(
                duration: const Duration(milliseconds: 800),
                type: PageTransitionType.leftToRight,
                child: ShopCartScreen()));
      },
      foregroundColor: green,
      child: Badge(
          badgeContent: Text(provider2.list.length.toString()),
          child: Image.asset("images/ic_bag.png")),
    );
  }
}
