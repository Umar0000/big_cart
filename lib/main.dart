import 'package:big_cart/provider/login_provider/login_provider.dart';
import 'package:big_cart/screens/login_screen.dart';
import 'package:big_cart/screens/splash_screen.dart';
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
    return  MultiProvider(
        providers: [
        ChangeNotifierProvider.value(
        value: LoginProvider(),
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
        LoginPath: (context) => LoginScreen()
      },
    ));
  }
}
