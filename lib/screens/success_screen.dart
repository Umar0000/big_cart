import 'package:big_cart/utils/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/styles.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenbg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Lottie.asset('assets/success.json', height: 200, width: 200),
                  Text(
                    "Congrats!",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: popin,
                        fontSize: 20,
                        fontWeight: bold),
                  ),
                  Text(
                    "Your Order #123456 is \n Successfully Received",
                    style: loginSubtitleStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    goToMainSCreen();
  }

  void goToMainSCreen() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushNamedAndRemoveUntil(
        context, Dashboard_path, (route) => false);
  }
}
