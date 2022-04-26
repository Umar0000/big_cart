import 'package:big_cart/provider/product_provider/product_provider.dart';
import 'package:big_cart/utils/enums.dart';
import 'package:big_cart/widgets/custome_widget/custome_app_bar.dart';
import 'package:big_cart/widgets/product_screen_widgets/future_builder_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  final String title;
  int? id;
  ProductScreen({Key? key, required this.title, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          CustomeAppBar(
              title: title,
              onBackPress: () {
                Navigator.pop(context);
              },
              isFilterVIsible: true,
              onFilterPress: () {}),
          Expanded(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: FutureBuilderWidgets(
                    resource: Resource.Product,
                    allProduct: provider.getAllProduct(),
                  )))
        ],
      ),
    );
  }
}
