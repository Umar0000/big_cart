import 'package:flutter/material.dart';

class LoginCover extends StatelessWidget {
  const LoginCover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        "images/login_cover.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
