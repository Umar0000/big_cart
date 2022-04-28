import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../provider/shop_cart_provider/shop_cart_provider.dart';
import '../../screens/checkout_screen.dart';
import '../../utils/styles.dart';
import '../custome_widget/custome_btn.dart';

class Fotter extends StatelessWidget {
  final bool isCheckoutScreen;
  int? price;

  Fotter({Key? key, required this.isCheckoutScreen, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShopCartProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        color: white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "subtotal",
                  style: subtotalStyle,
                ),
                isCheckoutScreen
                    ? Text(
                        "\$${provider.price}",
                        style: subtotalStyle,
                      )
                    : Text(price.toString())
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping charges",
                  style: subtotalStyle,
                ),
                Text(
                  "\$50",
                  style: subtotalStyle,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey[300],
              height: 1,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: heading2,
                ),
                isCheckoutScreen
                    ? provider.price == 0
                        ? const Text("\$0")
                        : Text(
                            "\$${provider.price + 50}",
                            style: heading2,
                          )
                    : Text("\$${price!.toInt() + 50}")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomeButton(
                title: "Checkout",
                onPress: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 800),
                        type: PageTransitionType.leftToRight,
                        child: const CheckOutScreen()),
                  );
                })
          ],
        ),
      ),
    );
  }
}
