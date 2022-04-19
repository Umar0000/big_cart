import 'package:big_cart/utils/styles.dart';
import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.green,
      child: Stack(
        children: [
          Image.asset(
            "images/cover.jpg",
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 120,
              left: 40,
              child: Text(
                "20% off on your \n first purchase",
                style: heading2,
              ))
        ],
      ),
    );
  }
}
