import 'package:big_cart/screens/dashboard.dart';
import 'package:big_cart/screens/login_screen.dart';
import 'package:big_cart/widgets/custome_widget/custome_btn.dart';
import 'package:big_cart/widgets/login_widget/widget_email_textField.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../provider/login_provider/login_provider.dart';
import '../../utils/golbal_function_veriables.dart';
import '../../utils/styles.dart';
import 'login_footer.dart';

class LoginFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginProvider>(context, listen: true);

    return Form(child: Builder(
      builder: (cxt) {
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
              controller: provider.email,
              icon: Icons.email_outlined,
              onchange: (String value) {},
            ),
            const SizedBox(
              height: 5,
            ),
            PasswordEditText(
              controller: provider.password,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter your Password";
                } else if (value.length < 6) {
                  return "Password enter at-least 6 character";
                }
                return null;
              },
              onchange: (String value) {},
            ),
            const SizedBox(
              height: 5,
            ),
            provider.isLoading
                ? const CircularProgressIndicator()
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Switch(value: false, onChanged: (value) {}),
                      Expanded(
                        child: Text(
                          "Remember me",
                          style: rememberStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgor password",
                    style: TextStyle(
                        color: Colors.blue, fontFamily: popin, fontSize: 13),
                  ),
                ))
              ],
            ),
            CustomeButton(
                title: "Login",
                onPress: () {
                  var isValidate = Form.of(cxt)?.validate();
                  if (isValidate!) {
                    print(provider.email.text);
                    print(provider.password.text);
                    provider
                        .sendLoginRegistrationRequest(
                            false, provider.email.text, provider.password.text)
                        .then((value) {
                      if (value == "Success") {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 800),
                            type: PageTransitionType.leftToRight,
                            child: Dashboard(),
                          ),
                        );
                      } else {
                        showToast(value);
                      }
                    });
                  }
                }),
            const SizedBox(
              height: 10,
            ),
            LoginFotter(
                loginSingUpText: "Sign Up",
                sentenceText: "Don't have an account ? ",
                onPress: () {
                  pushReplacement(
                      context,
                      const LoginScreen(
                        isRegistrationScrren: true,
                      ));
                })
          ],
        );
      },
    ));
  }
}
