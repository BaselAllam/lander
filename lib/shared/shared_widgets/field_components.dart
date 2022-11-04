import 'package:flutter/material.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';


SnackBar snack(String content, Color color) {
  return SnackBar(
    backgroundColor: color,
    content: Text(content, style: SharedFonts.subWhiteFont,),
    duration: const Duration(seconds: 3),
  );
}


OutlineInputBorder border(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(color: color, width: 1.0)
  );
}