import 'package:big_cart/provider/login_provider/login_provider.dart';
import 'package:big_cart/screens/login_screen.dart';
import 'package:big_cart/utils/route_constant.dart';
import 'package:big_cart/widgets/custome_widget/custome_btn.dart';
import 'package:big_cart/widgets/login_widget/widget_email_textField.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../utils/styles.dart';
import 'login_footer.dart';

class LoginFormField extends StatelessWidget {
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
              controller: Provider.of<LoginProvider>(context).email,
              icon: Icons.email_outlined,
            ),
            const SizedBox(
              height: 5,
            ),
            PasswordEditText(
              controller: Provider.of<LoginProvider>(context).password,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter your Password";
                } else if (value.length < 7) {
                  return "Password enter at-least 6 character";
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Switch(value: false, onChanged: (value) {}),
                      Text(
                        "Remember me",
                        style: rememberStyle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 0,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgor password",
                        style: TextStyle(color: Colors.blue, fontFamily: popin),
                      ),
                    ))
              ],
            ),
            CustomeButton(
                title: "Login",
                onPress: () {
                  Form.of(context)?.validate();
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeScreenPath, (route) => false);
                }),
            const SizedBox(
              height: 10,
            ),
            LoginFotter(
                loginSingUpText: "Sign Up",
                sentenceText: "Don't have an account ? ",
                onPress: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 800),
                      type: PageTransitionType.leftToRight,
                      child: const LoginScreen(
                        isRegistrationScrren: true,
                      ),
                    ),
                  );
                  // Navigator.of(context).pushNamed(RegistrationPath);
                })
          ],
        );
      },
    ));
  }
}
