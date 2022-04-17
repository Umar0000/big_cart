import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class CustomeAppBar extends StatelessWidget {
  final String title;
  final void Function() onBackPress;
  final void Function() onFilterPress;
  final bool isFilterVIsible;
  const CustomeAppBar({
    required this.title,
    required this.onBackPress,
    required this.isFilterVIsible,
    required this.onFilterPress,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 120,
      child: Stack(
        children: [
          Positioned(
            top: 50,
            child: IconButton(
                onPressed: onBackPress,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: popin,
                    fontWeight: bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
          ),
          isFilterVIsible
              ? Container(
                  margin: const EdgeInsets.only(top: 25, right: 10),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        "images/ic_filter.png",
                        height: 10,
                      )),
                )
              : Container()
        ],
      ),
    );
  }
}
