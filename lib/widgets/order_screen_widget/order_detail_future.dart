import 'package:big_cart/models/order_model/order_model.dart';
import 'package:big_cart/widgets/custome_widget/custome_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shop_cart_widget/footer.dart';
import 'order_roduct_item.dart';

class OrderDetails extends StatelessWidget {
  List<OrderItems>? allProduct;
  int price;

  OrderDetails({Key? key, required this.allProduct, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomeAppBar(
              title: "Order Details",
              onBackPress: () {
                Navigator.pop(context);
              },
              isFilterVIsible: false,
              onFilterPress: () {}),
          Expanded(
            child: SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: allProduct?.length ?? 0,
                  itemBuilder: (context, index) {
                    return OrderProductItem(
                        data: allProduct![index], index: index);
                  }),
            ),
          ),
          Fotter(
            isCheckoutScreen: false,
            price: price,
          )
        ],
      ),
    );
  }
}
