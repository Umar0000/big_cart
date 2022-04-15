import 'package:big_cart/widgets/login_widget/widget_login_card.dart';
import 'package:flutter/material.dart';

import '../widgets/login_widget/widget_login_cover.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(top: 0, child: LoginCover()),
          Positioned(
              top: MediaQuery.of(context).size.height * .60,
              child: LoginCard()),
        ],
      ),
    );
  }
}
