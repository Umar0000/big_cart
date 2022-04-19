import 'package:big_cart/widgets/custome_widget/custome_app_bar.dart';
import 'package:big_cart/widgets/product_screen_widgets/future_builder_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final String title;
  const ProductScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: const FutureBuilderWisgets()))
        ],
      ),
    );
  }
}
