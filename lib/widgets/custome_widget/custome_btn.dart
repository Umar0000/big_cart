import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class CustomeButton extends StatelessWidget {
  final String title;
  final void Function() onPress;
  const CustomeButton({Key? key, required this.title, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color(0xffAEDC81),
                Color(0xff6CC51D),
              ])),
          child: Center(
              child: Text(
            title,
            style: TextStyle(color: white, fontFamily: popin, fontWeight: bold),
          )),
        ));
  }
}
