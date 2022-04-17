import 'package:big_cart/provider/check_provider/checkout_provider.dart';
import 'package:big_cart/provider/login_provider/login_provider.dart';
import 'package:big_cart/provider/registration_provider/registration_provider.dart';
import 'package:big_cart/provider/shop_cart_provider/shop_cart_provider.dart';
import 'package:big_cart/screens/checkout_screen.dart';
import 'package:big_cart/screens/login_screen.dart';
import 'package:big_cart/screens/product_screen.dart';
import 'package:big_cart/screens/shop_cart_screen.dart';
import 'package:big_cart/screens/splash_screen.dart';
import 'package:big_cart/screens/success_screen.dart';
import 'package:big_cart/utils/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: LoginProvider(),
          ),
          ChangeNotifierProvider.value(
            value: RegistrationProvider(),
          ),
          ChangeNotifierProvider.value(
            value: CheckOutProvider(),
          ),
          ChangeNotifierProvider.value(
            value: ShopCartProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          initialRoute: ProductScreenPath,
          routes: {
            SplashPath: (context) => SplashScreen(),
            LoginPath: (context) => const LoginScreen(
                  isRegistrationScrren: false,
                ),
            RegistrationPath: (context) => const LoginScreen(
                  isRegistrationScrren: true,
                ),
            CheckoutPath: (context) => const CheckOutScreen(),
            SuccessScreenPath: (context) => const SuccessScreen(),
            ShoppingCartPath: (context) => const ShopCartScreen(),
            ProductScreenPath: (context) => const ProductScreen(),
          },
        ));
  }
}
