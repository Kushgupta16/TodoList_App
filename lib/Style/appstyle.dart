import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle{

  static Color bgColor = Colors.white;
  static Color mainColor = Colors.white;
  static Color accentColor = Colors.blue;

  static List<Color> cardsColor = [
    Colors.white,
    Colors.blue.shade100,
    Colors.purple.shade100,
    Colors.green.shade100,
    Colors.pinkAccent.shade100,
    Colors.lightGreenAccent.shade100,
    Colors.red.shade100,
    Colors.yellow.shade100,
  ];


  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold);

  static TextStyle mainContent =
  GoogleFonts.nunito(fontSize: 17,fontWeight: FontWeight.normal);

  static TextStyle dateTitle =
  GoogleFonts.roboto(fontSize: 12,fontWeight: FontWeight.w400);


}