import 'package:big_cart/widgets/product_screen_widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

import '../../models/item_models/item_model.dart';
import '../../mouckData/mouckData.dart';

class FutureBuilderWisgets extends StatelessWidget {
  const FutureBuilderWisgets({Key? key}) : super(key: key);
  Future<List<Item>> getData() async {
    var response = await list;
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                            mainAxisExtent: 260),
                    itemBuilder: (context, index) {
                      return ProductItem(data: snapshot.data?[index]);
                    }),
              ),
            );
          }
        });
  }
}
