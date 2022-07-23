import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = Color(0xFFe2e2ff);
  static Color maincolor = Color(0xFF000633);
  static Color accentColor = Color(0xFF0065FF);

  ////////////////////////////    Setting up thr different color cards for our notes     //////////////////
  static List<Color> cardsColor= [
    Colors.white,
    Colors.greenAccent,
    Colors.pinkAccent,
    Colors.blueGrey,
    Colors.blue,
    Colors.redAccent,
    Colors.orange,
    Colors.teal,
    Colors.yellow,
    Colors.purpleAccent,
  ];

  //////////////////////////     Setting up the fonts for the notes //////////////////////////

  static TextStyle mainTitle =GoogleFonts.roboto
    (
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
  static TextStyle mainContent =GoogleFonts.nunito
    (
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
  );
  static TextStyle dateTitle =GoogleFonts.roboto
    (
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  );

}