import 'package:big_cart/screens/checkout_screen.dart';
import 'package:big_cart/widgets/custome_widget/custome_app_bar.dart';
import 'package:big_cart/widgets/custome_widget/custome_btn.dart';
import 'package:big_cart/widgets/shop_cart_widget/product_images.dart';
import 'package:big_cart/widgets/shop_cart_widget/quantity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../provider/shop_cart_provider/shop_cart_provider.dart';
import '../utils/styles.dart';

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
            SizedBox(
              height: 350,
              child: ListView.builder(
                  itemCount: provider.list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      color: white,
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: 0.2,
                          children: [
                            SlidableAction(
                              onPressed: (_) {
                                provider.removeItem(index);
                              },
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ProductImages(
                                imagePath:
                                    provider.list[index].imageUrl.toString(),
                                imageWidth: 60,
                                imageHeight: 70,
                                circleWidth: 60,
                                circleHeight: 60),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      provider.getListItem(index).price!,
                                      style: const TextStyle(
                                        color: green,
                                      ),
                                    ),
                                    Text(
                                      provider.getListItem(index).title!,
                                      style: TextStyle(
                                          fontWeight: bold,
                                          fontFamily: popin,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      provider.getListItem(index).calories!,
                                      style: const TextStyle(color: lightgrey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            QuatityWidget(index: index)
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                        Text(
                          "\$56.5",
                          style: subtotalStyle,
                        )
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
                          "\$16",
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
                        Text(
                          "\$16",
                          style: heading2,
                        )
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
            )
          ],
        ),
      ),
    );
  }
}
