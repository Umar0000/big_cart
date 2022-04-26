import 'package:big_cart/models/product_model/product_model.dart';
import 'package:big_cart/provider/shop_cart_provider/shop_cart_provider.dart';
import 'package:big_cart/widgets/shop_cart_widget/product_images.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../models/item_models/item_model.dart';
import '../../provider/product_provider/product_provider.dart';
import '../../utils/styles.dart';

class ProductItem extends StatefulWidget {
  ProductData? data;
  final int index;
  ProductItem({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int itemCount = 1;
  bool isIncrementDisable = false;
  bool isDecrimenttDisable = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context, listen: false);
    var provider2 = Provider.of<ShopCartProvider>(context, listen: false);
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
            imagePath: widget.data?.image ?? "",
            imageWidth: 80,
            imageHeight: 90,
            circleWidth: 70,
            circleHeight: 70,
          ),
          Text(
            widget.data?.unit.toString() ?? "",
            style: TextStyle(color: green, fontFamily: popin),
          ),
          Text(
            widget.data?.title ?? "",
            style: heading3,
          ),
          Text(
            "\$${widget.data?.price.toString()}",
            style: TextStyle(color: lightgrey, fontFamily: popin),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.grey[300],
            height: 1,
            width: double.infinity,
          ),
          Expanded(
            child: Container(
              child: Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  extentRatio: 0.4,
                  children: [
                    SlidableAction(
                      onPressed: (_) {
                        provider2.setPrice(widget.data!.price!.toInt());
                        provider2.listAdd(Item(
                            id: widget.data!.id,
                            catId: widget.data!.catId,
                            imageUrl: widget.data!.image,
                            title: widget.data!.title,
                            price: widget.data!.price,
                            stock: widget.data!.stockAvailable,
                            unit: widget.data!.unit,
                            qty: itemCount));
                      },
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
                        onPressed: !isIncrementDisable
                            ? () {
                                setState(() {
                                  provider2
                                      .setPrice(widget.data!.price!.toInt());

                                  var qty = widget.data!.stockAvailable;
                                  if (itemCount <= qty!.toInt()) {
                                    itemCount++;
                                    isIncrementDisable = false;
                                    isDecrimenttDisable = false;
                                  } else {
                                    isDecrimenttDisable = false;
                                    isIncrementDisable = true;
                                  }
                                });
                              }
                            : null,
                        icon: isIncrementDisable
                            ? const Icon(
                                Icons.add,
                                color: lightgrey,
                              )
                            : const Icon(
                                Icons.add,
                                color: green,
                              )),
                    Text(itemCount.toString()),
                    IconButton(
                      onPressed: !isDecrimenttDisable
                          ? () {
                              setState(() {
                                if (itemCount > 1) {
                                  itemCount--;
                                  isDecrimenttDisable = false;
                                  isIncrementDisable = false;
                                } else {
                                  isDecrimenttDisable = true;
                                  isIncrementDisable = false;
                                }
                              });
                            }
                          : null,
                      icon: isDecrimenttDisable
                          ? const Icon(
                              Icons.remove,
                              color: lightgrey,
                            )
                          : const Icon(
                              Icons.remove,
                              color: green,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
