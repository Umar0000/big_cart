import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/route_constant.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToMainSCreen();
  }

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Image.asset(
          "images/splash_bg.png",
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Container(
          margin: EdgeInsets.only(top: isLandscape ? 55.0 : 96.0),
          child: Column(
            children: [
              Expanded(
                flex: isLandscape ? 5 : 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to",
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                    Image.asset(
                      "images/ic_big_text.png",
                      width: 120,
                      height: 40,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet , consetetur \n sadipscing elitr, sed diam nonumy",
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 11,
                          color: isLandscape
                              ? Colors.grey[800]
                              : Color(0xff868889)),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "POWERED BY",
                      style: TextStyle(
                          color: isLandscape
                              ? Colors.grey[800]
                              : const Color(0xff868889),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 11,
                          letterSpacing: 2),
                    ),
                    Text(
                      "TECH IDARA",
                      style: TextStyle(
                          letterSpacing: 5,
                          color: isLandscape
                              ? Colors.lightGreen
                              : const Color(0xff6CC51D),
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void goToMainSCreen() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushNamedAndRemoveUntil(context, LoginPath, (route) => false);
  }
}
