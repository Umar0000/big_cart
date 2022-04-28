import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/drawe_provider/drawer_provider.dart';
import '../../utils/enums.dart';
import '../../utils/golbal_function_veriables.dart';
import '../../utils/route_constant.dart';
import '../../utils/styles.dart';

class DraweLayoutWidget extends StatelessWidget {
  const DraweLayoutWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DrawerProvider>(context, listen: false);

    return SafeArea(
        child: ListTileTheme(
      textColor: Colors.white,
      iconColor: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'images/ic_big_text.png',
                    fit: BoxFit.contain,
                    width: 10,
                    height: 20,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.screenName(Screen.HomeScreen);
                  provider.advancedDrawerController.toggleDrawer();
                  Navigator.pushNamedAndRemoveUntil(
                      context, Dashboard_path, (route) => false);
                },
                leading: const Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(fontFamily: popin),
                ),
              ),
              ListTile(
                onTap: () {
                  provider.screenName(Screen.Order);
                  // _advancedDrawerController.hideDrawer();
                  provider.advancedDrawerController.toggleDrawer();
                  Navigator.pushNamedAndRemoveUntil(
                      context, Dashboard_path, (route) => false);
                },
                leading: const Icon(Icons.shopping_cart_outlined),
                title: Text(
                  'Order',
                  style: TextStyle(fontFamily: popin),
                ),
              ),
              Expanded(
                child: ListTile(
                  onTap: () {
                    provider.advancedDrawerController.toggleDrawer();
                    logout(context);
                  },
                  leading: Icon(Icons.logout),
                  title: Text(
                    'Logout',
                    style: TextStyle(fontFamily: popin),
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text(
                      'Terms of Service | Privacy Policy',
                      style: TextStyle(fontFamily: popin),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
