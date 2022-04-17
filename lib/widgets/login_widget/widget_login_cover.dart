import 'package:flutter/material.dart';

class LoginCover extends StatelessWidget {
  final String imagePath;
  const LoginCover({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
