import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//=======================================================================================
//              TODO : TextStyle
//=======================================================================================

var popin = GoogleFonts.poppins().fontFamily;
var bold = FontWeight.bold;
var welcomeFontStyle = TextStyle(
    fontWeight: bold, letterSpacing: 1, fontSize: 20, fontFamily: popin);

var textFieldStyle =
    TextStyle(fontFamily: popin, color: lightgrey, fontSize: 15);
var rememberStyle = TextStyle(fontFamily: popin, color: lightgrey);

var loginSubtitleStyle = TextStyle(color: lightgrey, fontSize: 13);
var heading = TextStyle(
  color: white,
  fontSize: 20,
  fontFamily: popin,
  fontWeight: FontWeight.bold,
);
var heading2 = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontFamily: popin,
  fontWeight: FontWeight.bold,
);
var heading3 = TextStyle(
  color: Colors.black,
  fontSize: 15,
  fontFamily: popin,
  fontWeight: FontWeight.bold,
);

var subtotalStyle = TextStyle(color: lightgrey, fontFamily: popin);
//=======================================================================================
//              TODO : emaiL field Decoration Login
//=======================================================================================

InputDecoration decorationHintStyle(
    String hint, String icon_path, IconData icon) {
  return InputDecoration(
    contentPadding: const EdgeInsets.only(top: 14),
    hintText: hint,
    hintStyle: textFieldStyle,
    errorStyle: TextStyle(color: Colors.red),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
    fillColor: white,
    filled: true,
    enabledBorder: InputBorder.none,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(color: white, width: 0),
    ),
    prefixIcon: !icon_path.isEmpty
        ? Image.asset(
            icon_path,
            width: 8,
            height: 8,
          )
        : Icon(icon),
  );
}

//=======================================================================================
//              TODO : password field Decoration Login
//=======================================================================================

InputDecoration decorationPasswordHintStyle(
    String hint, String icon_path, Widget icon) {
  return InputDecoration(
    contentPadding: const EdgeInsets.only(top: 11),
    hintText: hint,
    hintStyle: textFieldStyle,
    prefixIcon: const Icon(Icons.lock),
    suffixIcon: icon,
    fillColor: white,
    filled: true,
    enabledBorder: InputBorder.none,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(color: white, width: 0),
    ),
  );
}

//=======================================================================================
//              TODO : Colors
//=======================================================================================

const lightgrey = Color(0xff868889);

const fogotTextColor = Color(0xff407EC7);
const screenbg = Color(0xffF4F5F9);
const white = Colors.white;
const green = Color(0xff6CC51D);
