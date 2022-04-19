import 'package:big_cart/models/item_models/item_model.dart';
import 'package:big_cart/widgets/shop_cart_widget/product_images.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../utils/styles.dart';

class ProductItem extends StatelessWidget {
  Item? data;
  ProductItem({Key? key, required this.data}) : super(key: key);

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
              imagePath: data?.imageUrl ?? "",
              imageWidth: 80,
              imageHeight: 90,
              circleWidth: 70,
              circleHeight: 70),
          Text(
            data?.price ?? "",
            style: TextStyle(color: green, fontFamily: popin),
          ),
          Text(
            data?.title ?? "",
            style: heading2,
          ),
          Text(
            data?.calories ?? "",
            style: TextStyle(color: lightgrey, fontFamily: popin),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.grey[300],
            height: 1,
            width: double.infinity,
          ),
          Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.4,
              children: [
                SlidableAction(
                  onPressed: (_) {},
                  backgroundColor: Colors.lightGreen,
                  foregroundColor: Colors.white,
                  icon: Icons.shopping_bag_outlined,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: green,
                    )),
                Text("5"),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove,
                      color: green,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
