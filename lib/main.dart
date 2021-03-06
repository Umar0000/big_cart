import 'package:big_cart/provider/check_provider/checkout_provider.dart';
import 'package:big_cart/provider/drawe_provider/drawer_provider.dart';
import 'package:big_cart/provider/home_screen_provider/home_screen_provider.dart';
import 'package:big_cart/provider/login_provider/login_provider.dart';
import 'package:big_cart/provider/order_provider/order_provider.dart';
import 'package:big_cart/provider/product_provider/product_provider.dart';
import 'package:big_cart/provider/registration_provider/registration_provider.dart';
import 'package:big_cart/provider/shop_cart_provider/shop_cart_provider.dart';
import 'package:big_cart/provider/user_provider/user_provider.dart';
import 'package:big_cart/screens/checkout_screen.dart';
import 'package:big_cart/screens/dashboard.dart';
import 'package:big_cart/screens/home_screen.dart';
import 'package:big_cart/screens/login_screen.dart';
import 'package:big_cart/screens/order_screen.dart';
import 'package:big_cart/screens/product_screen.dart';
import 'package:big_cart/screens/search_product_screen.dart';
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
            value: ProductProvider(),
          ),
          ChangeNotifierProvider.value(
            value: HomeScreenProvider(),
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
          ChangeNotifierProvider.value(
            value: UserProvider(),
          ),
          ChangeNotifierProvider.value(
            value: DrawerProvider(),
          ),
          ChangeNotifierProvider.value(
            value: OrderProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          initialRoute: SplashPath,
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
            searchProderPath: (context) => SearchProductScreen(),
            ShoppingCartPath: (context) => ShopCartScreen(),
            orderScreenPath: (context) => OrderScreen(),
            Dashboard_path: (context) => Dashboard(),
            ProductScreenPath: (context) => ProductScreen(
                  title: "",
                ),
            HomeScreenPath: (context) => HomeScreen(),
          },
        ));
  }
}
