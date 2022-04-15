import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class EmailTextField extends StatelessWidget {
  TextEditingController email;
  String? Function(String value) validator;
  EmailTextField({Key? key, required this.email, required this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validator(value.toString());
      },
      textAlign: TextAlign.left,
      controller: email,
      style: textFieldStyle,
      keyboardType: TextInputType.emailAddress,
      decoration: decorationHintStyle("Email Address", "images/ic_email.png"),
    );
  }
}
