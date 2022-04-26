import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/shop_cart_provider/shop_cart_provider.dart';

class ProductImages extends StatelessWidget {
  final String? imagePath;
  final double imageWidth;
  final double imageHeight;
  final double circleWidth;
  final double circleHeight;

  ProductImages({
    required this.imagePath,
    required this.imageWidth,
    required this.imageHeight,
    required this.circleWidth,
    required this.circleHeight,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ShopCartProvider>(context, listen: false);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Container(
            width: circleWidth,
            height: circleHeight,
            decoration: BoxDecoration(
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(0.1),
                borderRadius: BorderRadius.circular(50)),
          ),
          Container(
            margin: EdgeInsets.only(top: 13),
            child: Image.network(
              imagePath ?? "",
              width: imageWidth,
              height: imageHeight,
            ),
          ),
        ],
      ),
    );
  }
}
