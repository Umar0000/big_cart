import 'package:big_cart/provider/registration_provider/registration_provider.dart';
import 'package:big_cart/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../custome_widget/custome_btn.dart';
import '../login_widget/login_footer.dart';
import '../login_widget/widget_email_textField.dart';

class RegistrationFromField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(child: Builder(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomeEditText(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter your Email";
                } else if (!value.contains("@") || !value.contains(".com")) {
                  return "Invalid Email";
                }
                return null;
              },
              inputType: TextInputType.emailAddress,
              hintText: "Email Address",
              iconPath: "images/ic_email.png",
              controller: Provider.of<RegistrationProvider>(context).email,
              icon: Icons.email_outlined,
            ),
            const SizedBox(
              height: 5,
            ),
            CustomeEditText(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter your Phone";
                } else if (!value.startsWith("03")) {
                  return "Invalid Phone Number";
                }
                return null;
              },
              inputType: TextInputType.phone,
              hintText: "Phone number",
              iconPath: "images/ic_call.png",
              controller: Provider.of<RegistrationProvider>(context).phone,
              icon: Icons.call,
            ),
            const SizedBox(
              height: 5,
            ),
            PasswordEditText(
              controller: Provider.of<RegistrationProvider>(context).password,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter your Password";
                } else if (value.length < 7) {
                  return "Password enter at-least 6 character";
                }
                return null;
              },
            ),
            CustomeButton(
                title: "Signup",
                onPress: () {
                  Form.of(context)?.validate();
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 800),
                        type: PageTransitionType.leftToRight,
                        child: const LoginScreen(isRegistrationScrren: false)),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            LoginFotter(
                loginSingUpText: "Login",
                sentenceText: "Already have an account ? ",
                onPress: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 800),
                      type: PageTransitionType.leftToRight,
                      child: const LoginScreen(
                        isRegistrationScrren: false,
                      ),
                    ),
                  );
                  // Navigator.of(context).pushNamed(LoginPath);
                })
          ],
        );
      },
    ));
  }
}
