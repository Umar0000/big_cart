import 'package:big_cart/widgets/checkout_widget/checkout_form.dart';
import 'package:big_cart/widgets/custome_widget/custome_app_bar.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenbg,
      body: Column(
        children: [
          CustomeAppBar(
              title: "Checkout",
              isFilterVIsible: false,
              onFilterPress: () {},
              onBackPress: () {
                Navigator.pop(context);
              }),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: CheckoutForm())
        ],
      ),
    );
  }
}
