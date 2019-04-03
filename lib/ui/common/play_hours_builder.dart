import 'package:flutter/material.dart';
import 'package:helios_app/other/helpers/constants.dart';
import 'package:intl/intl.dart';

List<TextSpan> buildPlayHours(List<DateTime> playHours, {double fontSize}) {
  List<TextSpan> textSpans = [];

  playHours.forEach((playHour) {
    textSpans.add(
      TextSpan(
        text: "${DateFormat("HH:mm").format(playHour)}",
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontFamily: "Poppins",
          fontSize: fontSize,
          fontWeight: FontWeight.w100,
        ),
      ),
    );

    textSpans.add(TextSpan(text: Constants.spaceBetweenPlayHours));
  });

  return textSpans;
}
