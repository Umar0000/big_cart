import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class HeadingWithIcon extends StatelessWidget {
  final String title;
  final void Function() onPress;
  const HeadingWithIcon({Key? key, required this.title, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: heading2,
        ),
        IconButton(
            onPressed: onPress, icon: const Icon(Icons.arrow_forward_ios))
      ],
    );
  }
}
