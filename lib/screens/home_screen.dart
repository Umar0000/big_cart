import 'package:big_cart/provider/product_provider/product_provider.dart';
import 'package:big_cart/screens/search_product_screen.dart';
import 'package:big_cart/utils/golbal_function_veriables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/enums.dart';
import '../widgets/home_screen_widget/card_fcb_widget.dart';
import '../widgets/home_screen_widget/categories_widget.dart';
import '../widgets/home_screen_widget/cover_image_widget.dart';
import '../widgets/home_screen_widget/heading_with_icon_widget.dart';
import '../widgets/home_screen_widget/home_header.dart';
import '../widgets/product_screen_widgets/future_builder_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
          child: Column(
            children: [
              HomeHeader(
                title: 'Home',
                isDawer: true,
                rightIconPress: () {
                  pushName(context, SearchProductScreen());
                },
              ),
              const CoverImage(),
              HeadingWithIcon(title: "Categories", onPress: () {}),
              const CategoriesWidget(),
              HeadingWithIcon(title: "Feature products", onPress: () {}),
              Container(
                  height: 500,
                  child: FutureBuilderWidgets(
                      resource: Resource.MainFeature,
                      allProduct: provider.getAllProduct()))
            ],
          ),
        ),
      ),
      floatingActionButton: CardFloatingBtn(),
    );
  }
}
