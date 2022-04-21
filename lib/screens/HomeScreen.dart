import 'package:big_cart/screens/shop_cart_screen.dart';
import 'package:big_cart/utils/enums.dart';
import 'package:big_cart/utils/styles.dart';
import 'package:big_cart/widgets/home_screen_widget/heading_with_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../widgets/home_screen_widget/categories_widget.dart';
import '../widgets/home_screen_widget/cover_image_widget.dart';
import '../widgets/home_screen_widget/search_widget.dart';
import '../widgets/product_screen_widgets/future_builder_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
          child: Column(
            children: [
              SearchWidget(hint: "Search keyword...", controller: search),
              const CoverImage(),
              HeadingWithIcon(title: "Categories", onPress: () {}),
              CategoriesWidget(),
              HeadingWithIcon(title: "Feature products", onPress: () {}),
              Container(
                  height: 500,
                  child: FutureBuilderWisgets(
                    resource: Resource.MainFeature,
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  duration: const Duration(milliseconds: 800),
                  type: PageTransitionType.leftToRight,
                  child: ShopCartScreen()));
        },
        foregroundColor: green,
        child: Image.asset("images/ic_bag.png"),
      ),
    );
  }
}
