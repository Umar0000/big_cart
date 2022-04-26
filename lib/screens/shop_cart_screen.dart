import 'package:big_cart/widgets/custome_widget/custome_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/shop_cart_provider/shop_cart_provider.dart';
import '../widgets/shop_cart_widget/footer.dart';
import '../widgets/shop_cart_widget/list_item.dart';

class ShopCartScreen extends StatelessWidget {
  bool isIncrementDisable = false;

  bool isDecrimenttDisable = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShopCartProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomeAppBar(
              title: "Shopping Cart",
              isFilterVIsible: false,
              onFilterPress: () {},
              onBackPress: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListItem(),
            const SizedBox(
              height: 20,
            ),
            Fotter()
          ],
        ),
      ),
    );
  }
}
