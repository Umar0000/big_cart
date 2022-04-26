import 'package:big_cart/models/product_model/product_model.dart';
import 'package:big_cart/provider/product_provider/product_provider.dart';
import 'package:big_cart/utils/enums.dart';
import 'package:big_cart/widgets/product_screen_widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureBuilderWidgets extends StatelessWidget {
  Future<List<ProductData>?> allProduct;
  Resource resource;
  FutureBuilderWidgets(
      {Key? key, required this.resource, required this.allProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    return FutureBuilder<List<ProductData>?>(
        future: allProduct,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
                itemCount: snapshot.data?.length ?? 0,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    mainAxisExtent: 265),
                itemBuilder: (context, index) {
                  provider.badgesList.add(0);
                  return ProductItem(data: snapshot.data?[index], index: index);
                });
          }
        });
  }
}
