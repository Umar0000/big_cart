import 'package:big_cart/widgets/shop_cart_widget/product_images.dart';
import 'package:big_cart/widgets/shop_cart_widget/quantity_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../provider/shop_cart_provider/shop_cart_provider.dart';
import '../../utils/styles.dart';

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShopCartProvider>(context, listen: false);
    return ListView.builder(
        itemCount: provider.list.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            color: white,
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.2,
                children: [
                  SlidableAction(
                    onPressed: (_) {
                      setState(() {
                        var price = provider.list[index].qty!.toInt() *
                            provider.list[index].price!.toInt();

                        print(
                            "quantity ${provider.list[index].qty!.toInt()} \n");
                        print("price ${provider.list[index].price!.toInt()}");
                        print("minus price ${price}");
                        provider.setMinusPrice(price);
                        // provider.setMinusTotalPrice(
                        //     provider.list[index].price!.toInt());
                        provider.removeItem(index);
                        if (provider.list.isEmpty) {
                          provider.setInitPrice();
                          Navigator.pop(context);
                        }
                      });
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
                    imagePath: provider.list[index].imageUrl.toString(),
                    imageWidth: 60,
                    imageHeight: 70,
                    circleWidth: 60,
                    circleHeight: 60,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            provider.getListItem(index).price.toString(),
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
                            provider.getListItem(index).unit!,
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
        });
  }
}
