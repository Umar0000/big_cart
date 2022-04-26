import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/item_models/item_model.dart';
import '../../provider/shop_cart_provider/shop_cart_provider.dart';
import '../../utils/styles.dart';

class QuatityWidget extends StatefulWidget {
  int index;
  QuatityWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<QuatityWidget> createState() => _QuatityWidgetState();
}

class _QuatityWidgetState extends State<QuatityWidget> {
  bool isIncrementDisable = false;
  bool isDecrimenttDisable = false;
  // int index;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShopCartProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: !isIncrementDisable
                ? () {
                    setState(() {
                      var qty = provider.getListItem(widget.index).stock;
                      int count = provider.list[widget.index].qty!.toInt();
                      if (count <= qty!.toInt()) {
                        count++;
                        provider.setPrice(
                            provider.list[widget.index].price!.toInt());
                        // provider.setTotalPrice(
                        //     provider.list[widget.index].price!.toInt());
                        provider.updateList(
                            widget.index,
                            Item(
                                id: provider.getListItem(widget.index).id,
                                catId: provider.getListItem(widget.index).catId,
                                imageUrl:
                                    provider.getListItem(widget.index).imageUrl,
                                price: provider.getListItem(widget.index).price,
                                title: provider.getListItem(widget.index).title,
                                unit: provider.getListItem(widget.index).unit,
                                stock: provider.getListItem(widget.index).stock,
                                qty: count));

                        print(provider.getListItem(widget.index).qty);
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
        Center(
            child: Text(
          provider.getListItem(widget.index).qty.toString(),
        )),
        IconButton(
          onPressed: !isDecrimenttDisable
              ? () {
                  setState(() {
                    int count = provider.getListItem(widget.index).qty!.toInt();
                    if (count > 1) {
                      count--;
                      provider.setMinusPrice(
                          provider.list[widget.index].price!.toInt());
                      // provider.setMinusTotalPrice(
                      //     provider.list[widget.index].price!.toInt());
                      provider.updateList(
                          widget.index,
                          Item(
                              id: provider.getListItem(widget.index).id,
                              catId: provider.getListItem(widget.index).catId,
                              imageUrl:
                                  provider.getListItem(widget.index).imageUrl,
                              price: provider.getListItem(widget.index).price!,
                              title: provider.getListItem(widget.index).title,
                              unit: provider.getListItem(widget.index).unit,
                              stock: provider.getListItem(widget.index).stock,
                              qty: count));
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
    );
  }
}
