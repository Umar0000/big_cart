import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/drawe_provider/drawer_provider.dart';
import '../../utils/styles.dart';

class HomeHeader extends StatelessWidget {
  void Function()? rightIconPress;
  final bool isDawer;

  final String title;
  HomeHeader({
    Key? key,
    required this.title,
    required this.isDawer,
    this.rightIconPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DrawerProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffF4F5F9),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {
                  provider.advancedDrawerController.showDrawer();
                },
                icon: const Icon(Icons.list),
              )),
          Expanded(
              child: Center(
            child: Text(
              title,
              style: heading2,
            ),
          )),
          isDawer
              ? IconButton(
                  onPressed: rightIconPress, icon: const Icon(Icons.search))
              : IconButton(
                  onPressed: rightIconPress,
                  icon: const Icon(Icons.arrow_back_rounded))
        ],
      ),
    );
  }
}
