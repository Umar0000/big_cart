import 'package:big_cart/provider/order_provider/order_provider.dart';
import 'package:big_cart/widgets/home_screen_widget/home_header.dart';
import 'package:big_cart/widgets/order_screen_widget/order_main_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  AdvancedDrawerController? advancedDrawerController;
  OrderScreen({Key? key, this.advancedDrawerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrderProvider>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            HomeHeader(
              title: 'OrderScreen',
              isDawer: true,
            ),
            Expanded(
                child: OrderMainListing(
              allProduct: provider.getAllProduct(),
            ))
          ],
        ),
      ),
    );
  }
}
