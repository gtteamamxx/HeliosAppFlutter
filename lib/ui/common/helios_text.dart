import 'package:flutter/material.dart';
import 'package:helios_app/other/helpers/constants.dart';

class HeliosText extends StatelessWidget {
  HeliosText(
    this.text, {
    this.fontSize,
    this.fontWeight,
    this.textDecoration,
    this.textAlign,
    this.color,
    this.overflow,
    this.height = 1.0,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final TextAlign textAlign;
  final Color color;
  final TextOverflow overflow;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      textAlign: this.textAlign,
      style: TextStyle(
        fontSize: this.fontSize,
        fontFamily: Constants.fontName,
        fontWeight: this.fontWeight,
        decoration: this.textDecoration,
        height: this.height,
        color: this.color,
      ),
      overflow: this.overflow,
    );
  }
}
