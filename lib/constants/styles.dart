import 'package:flutter/material.dart';


// Styles
class Style {
  static TextStyle Worksans(Color color, double d) {
    return TextStyle(
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.bold,
      fontSize: d,
      color: color,
    );
  }

  static TextStyle Josefin(Color color, double d) {
    return TextStyle(
      fontFamily: 'JosefinSans',
      fontWeight: FontWeight.bold,
      fontSize: d,
      color: color,
    );
  }

  static TextStyle Roboto(Color color, double d) {
    return TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.normal,
      fontSize: d,
      color: color,
    );
  }
}
