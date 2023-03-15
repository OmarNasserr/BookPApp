import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustText extends StatelessWidget {
  CustText(
      {required this.text,
      this.fontType = GoogleFonts.tajawal,
      required this.fontSize,
      this.bold = true,
      this.color = Colors.white,
      this.overflow = false,
      this.decoration = TextDecoration.none,
      this.fontWeight = FontWeight.bold,
       this.textDirection=TextDirection.ltr});

  final fontType;
  final String text;
  final double fontSize;
  final bool bold;
  final Color color;
  final TextDecoration decoration;
  final bool overflow;
  final FontWeight fontWeight;
  final TextDirection textDirection;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: textDirection,
      style: fontType(
          textStyle: TextStyle(
              color: color,
              fontSize: fontSize,
              decoration: decoration,
              overflow: overflow ? TextOverflow.visible : TextOverflow.ellipsis,
              fontWeight: bold ? fontWeight : FontWeight.normal)),
    );
  }
}
