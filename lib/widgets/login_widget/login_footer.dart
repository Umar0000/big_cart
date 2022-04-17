import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class LoginFotter extends StatelessWidget {
  final String sentenceText;
  final String loginSingUpText;
  final Function() onPress;
  LoginFotter(
      {Key? key,
      required this.sentenceText,
      required this.loginSingUpText,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sentenceText,
          style: rememberStyle,
        ),
        TextButton(
          child: Text(
            loginSingUpText,
            style: TextStyle(
                fontFamily: popin,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          onPressed: onPress,
        )
      ],
    );
  }
}
