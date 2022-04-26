import 'package:big_cart/widgets/home_screen_widget/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider/product_provider.dart';
import '../utils/enums.dart';
import '../widgets/product_screen_widgets/future_builder_widget.dart';

class OrderScreen extends StatelessWidget {
  AdvancedDrawerController? advancedDrawerController;
  OrderScreen({Key? key, this.advancedDrawerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
          child: Column(
            children: [
              HomeHeader(
                title: 'Home',
                isDawer: true,
              ),
              Container(
                  height: 500,
                  child: FutureBuilderWidgets(
                    resource: Resource.MainFeature,
                    allProduct: provider.getAllProduct(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
