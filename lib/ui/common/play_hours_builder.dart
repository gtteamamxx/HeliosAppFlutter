import 'package:flutter/material.dart';
import 'package:helios_app_flutter_x/models/play_hour/play_hour_model.dart';
import 'package:helios_app_flutter_x/other/helpers/constants.dart';
import 'package:intl/intl.dart';

List<TextSpan> buildPlayHours(List<PlayHourModel> playHours, {double fontSize}) {
  List<TextSpan> textSpans = [];
  playHours.forEach((playHour) {
    textSpans.add(
      TextSpan(
        text: "${DateFormat("HH:mm").format(playHour.date)}",
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontFamily: Constants.fontName,
          fontSize: fontSize,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
    textSpans.add(TextSpan(text: Constants.spaceBetweenPlayHours));
  });

  return textSpans;
}
