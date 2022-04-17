import 'package:big_cart/models/item_models/item_model.dart';
import 'package:big_cart/widgets/custome_widget/custome_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mouckData/mouckData.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);
  Future<List<Item>> getData() async {
    var response = await list;
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomeAppBar(
              title: "Vegitable",
              onBackPress: () {},
              isFilterVIsible: true,
              onFilterPress: () {}),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<List<Item>>(
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
                          ),
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 10,
                              color: Colors.green,
                              child: Text(snapshot.data?[index].title ?? ""),
                            );
                          }),
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
