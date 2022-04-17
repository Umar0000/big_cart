import 'dart:math' as math;

import 'package:big_cart/widgets/custome_widget/custome_app_bar.dart';
import 'package:big_cart/widgets/custome_widget/custome_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../mouckData/mouckData.dart';
import '../utils/styles.dart';

class ShopCartScreen extends StatelessWidget {
  const ShopCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomeAppBar(
              title: "Shopping Cart",
              isFilterVIsible: false,
              onFilterPress: () {},
              onBackPress: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 350,
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      color: white,
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          extentRatio: 0.2,
                          children: [
                            SlidableAction(
                              onPressed: (_) {},
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Color(
                                                (math.Random().nextDouble() *
                                                        0xFFFFFF)
                                                    .toInt())
                                            .withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Image.asset(
                                      "images/ic_broccoli.png",
                                      width: 60,
                                      height: 70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list[index].price!,
                                      style: const TextStyle(
                                        color: green,
                                      ),
                                    ),
                                    Text(
                                      list[index].title!,
                                      style: TextStyle(
                                          fontWeight: bold,
                                          fontFamily: popin,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      list[index].calories!,
                                      style: TextStyle(color: lightgrey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: green,
                                    )),
                                const Center(
                                    child: Text(
                                  "5",
                                  textAlign: TextAlign.center,
                                )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.maximize,
                                      color: green,
                                    ))
                              ],
                            ),
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
                    CustomeButton(title: "Checkout", onPress: () {})
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
