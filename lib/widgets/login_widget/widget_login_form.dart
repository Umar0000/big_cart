import 'package:big_cart/provider/login_provider/login_provider.dart';
import 'package:big_cart/widgets/login_widget/widget_email_textField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/styles.dart';

class LoginFormField extends StatelessWidget {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Form(child: Builder(
      builder: (context) {
        return Column(
          children: [
            EmailTextField(
                email: email,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Email";
                  }
                  return null;
                }),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              obscureText: Provider.of<LoginProvider>(context).isHide,
              textAlign: TextAlign.left,
              controller: password,
              style: textFieldStyle,
              keyboardType: TextInputType.text,
              decoration: decorationPasswordHintStyle(
                ".............",
                "images/ic_lock.png",
                InkWell(
                  onTap: () {
                    Provider.of<LoginProvider>(context, listen: false)
                        .showPassword();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Provider.of<LoginProvider>(context).isHide
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Form.of(context)?.validate();
                },
                child: Text("login"))
          ],
        );
      },
    ));
  }
}
