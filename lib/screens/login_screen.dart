import 'package:big_cart/widgets/login_widget/widget_login_card.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';
import '../widgets/login_widget/widget_login_cover.dart';

class LoginScreen extends StatelessWidget {
  final bool isRegistrationScrren;
  const LoginScreen({Key? key, required this.isRegistrationScrren})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      child: LoginCover(
                          imagePath: isRegistrationScrren
                              ? "images/registation_cover.png"
                              : "images/login_cover.png")),
                  Positioned(
                      top: 50,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Welcome",
                            style: heading,
                          ),
                        ),
                      )),
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.55,
                      left: 0.0,
                      right: 0.0,
                      bottom: 0.0,
                      child: LoginCard(
                        isRegistrationScrren: isRegistrationScrren,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
