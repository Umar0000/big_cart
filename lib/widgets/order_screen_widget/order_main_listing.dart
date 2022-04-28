import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/order_model/order_model.dart';
import '../../provider/order_provider/order_provider.dart';
import '../../utils/golbal_function_veriables.dart';
import 'order_detail_future.dart';

class OrderMainListing extends StatelessWidget {
  Future<List<OrderData>?> allProduct;
  OrderMainListing({Key? key, required this.allProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrderProvider>(context, listen: true);
    return FutureBuilder<List<OrderData>?>(
        future: allProduct,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.asset(
                        "images/ic_person.png",
                        color: Colors.white,
                      ),
                    ),
                    title: Text(snapshot.data?[index].name ?? ""),
                    subtitle: Text(snapshot.data?[index].email ?? ""),
                    trailing: IconButton(
                      onPressed: () {
                        print(snapshot.data?[index].items?.length.toString());

                        pushName(
                            context,
                            OrderDetails(
                                allProduct: snapshot.data?[index].items,
                                price: snapshot.data![index].totalPrice));
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                });
          }
        });
  }
}
