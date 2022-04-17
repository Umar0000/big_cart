import 'package:big_cart/widgets/custome_widget/custome_app_bar.dart';
import 'package:big_cart/widgets/product_screen_widgets/future_builder_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

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
          const FutureBuilderWisgets()
        ],
      ),
    );
  }
}
