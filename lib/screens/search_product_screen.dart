import 'package:big_cart/provider/product_provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/enums.dart';
import '../widgets/product_screen_widgets/future_builder_widget.dart';

class SearchProductScreen extends StatefulWidget {
  SearchProductScreen({Key? key}) : super(key: key);

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
                color: const Color(0xffF4F5F9),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: (value) {
                      setState(() {
                        provider.getSearch(value);
                      });
                    },
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "search product",
                      prefixIcon: Icon(Icons.search_outlined),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: FutureBuilderWidgets(
                  resource: Resource.MainFeature,
                  allProduct: provider.getSearch(controller.text)))
        ],
      ),
    );
  }
}
