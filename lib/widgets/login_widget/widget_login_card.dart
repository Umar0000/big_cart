import 'package:big_cart/widgets/login_widget/widget_login_form.dart';
import 'package:flutter/material.dart';

import '../../utils/styles.dart';
import '../registration_widget/registration_form_field.dart';

class LoginCard extends StatelessWidget {
  final bool isRegistrationScrren;
  LoginCard({Key? key, required this.isRegistrationScrren}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          color: Color(0xffF4F5F9),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              isRegistrationScrren ? "Create account" : "Welcome back !",
              style: welcomeFontStyle,
            ),
            Text(
              isRegistrationScrren
                  ? "Quickly create account"
                  : "Sign in to your account",
              style: TextStyle(color: lightgrey, fontSize: 13),
            ),
            const SizedBox(
              height: 20,
            ),
            isRegistrationScrren ? RegistrationFromField() : LoginFormField()
          ]),
        ),
      ),
    );
  }
}
