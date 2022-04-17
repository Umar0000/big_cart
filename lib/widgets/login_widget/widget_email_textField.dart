import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/login_provider/login_provider.dart';
import '../../utils/styles.dart';

class CustomeEditText extends StatelessWidget {
  String? Function(String value) validator;
  final TextEditingController controller;
  final TextInputType inputType;
  final String iconPath;
  final IconData icon;
  final String hintText;
  CustomeEditText({
    Key? key,
    required this.validator,
    required this.controller,
    required this.inputType,
    required this.iconPath,
    required this.icon,
    required this.hintText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validator(value.toString());
      },
      textAlign: TextAlign.left,
      controller: controller,
      style: textFieldStyle,
      keyboardType: inputType,
      decoration: decorationHintStyle(hintText, iconPath,icon),
    );
  }
}

class PasswordEditText extends StatelessWidget {
  String? Function(String value) validator;
  final TextEditingController controller;
  PasswordEditText({required this.validator, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validator(value.toString());
      },
      obscureText: Provider.of<LoginProvider>(context).isHide,
      textAlign: TextAlign.left,
      controller: controller,
      style: textFieldStyle,
      keyboardType: TextInputType.text,
      decoration: decorationPasswordHintStyle(
        ".............",
        "images/ic_lock.png",
        InkWell(
          onTap: () {
            Provider.of<LoginProvider>(context, listen: false).showPassword();
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
    );
  }
}
