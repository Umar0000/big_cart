import 'package:big_cart/widgets/custome_widget/custome_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/shop_cart_widget/footer.dart';
import '../widgets/shop_cart_widget/list_item.dart';

class ShopCartScreen extends StatelessWidget {
  bool isIncrementDisable = false;

  bool isDecrimenttDisable = false;

  ShopCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: Column(
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
          Expanded(
            child: Container(
                width: double.infinity,
                height: 300,
                margin: EdgeInsets.symmetric(horizontal: isLandScape ? 20 : 10),
                child: const ListItem()),
          ),
          const SizedBox(
            height: 20,
          ),
          Fotter(isCheckoutScreen: true)
        ],
      ),
    );
  }
}
