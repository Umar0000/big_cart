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
    TextStyle(fontFamily: popin, color: lightgrey, fontSize: 12);

var loginSubtitleStyle = TextStyle(color: lightgrey, fontSize: 13);
//=======================================================================================
//              TODO : emaiL field Decoration Login
//=======================================================================================

InputDecoration decorationHintStyle(String hint, String icon_path) {
  return InputDecoration(
    contentPadding: const EdgeInsets.only(top: 13),
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
    prefixIcon: Icon(Icons.email_outlined),
  );
}

//=======================================================================================
//              TODO : password field Decoration Login
//=======================================================================================

InputDecoration decorationPasswordHintStyle(
    String hint, String icon_path, Widget icon) {
  return InputDecoration(
    contentPadding: const EdgeInsets.only(top: 13),
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

var lightgrey = const Color(0xff868889);
var fogotTextColor = const Color(0xff407EC7);

var white = Colors.white;
