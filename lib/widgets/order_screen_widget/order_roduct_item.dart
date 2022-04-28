import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import '../../models/order_model/order_model.dart';
import '../../utils/styles.dart';
import '../shop_cart_widget/product_images.dart';

class OrderProductItem extends StatelessWidget {
  OrderItems? data;
  final int index;
  OrderProductItem({
    required this.data,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                color: const Color(0xffFDEFD5),
                child: const Text(
                  "new",
                  style: TextStyle(color: Color(0xffE8AD41)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: FavoriteButton(
                  iconSize: 20,
                  isFavorite: false,
                  valueChanged: (_isFavorite) {
                    print('Is Favorite : $_isFavorite');
                  },
                ),
              ),
            ],
          ),
          ProductImages(
            imagePath: data?.image ?? "",
            imageWidth: 80,
            imageHeight: 90,
            circleWidth: 70,
            circleHeight: 70,
          ),
          Text(
            data?.unit.toString() ?? "",
            style: TextStyle(color: green, fontFamily: popin),
          ),
          Text(
            data?.title ?? "",
            style: heading3,
          ),
          Text(
            "\$${data?.price.toString()}",
            style: TextStyle(color: lightgrey, fontFamily: popin),
          ),
        ],
      ),
    );
  }
}
