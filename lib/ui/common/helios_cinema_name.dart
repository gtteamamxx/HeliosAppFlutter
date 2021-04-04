import 'package:flutter/material.dart';
import 'package:helios_app_flutter_x/ui/common/helios_text.dart';

class HeliosCinemaName extends StatelessWidget {
  HeliosCinemaName({
    this.cinemaName,
    this.height,
    this.padding,
  });
  final String cinemaName;
  final double height;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    List<String> spltitedCinemaName = this.cinemaName.split('Helios');
    String cityName = spltitedCinemaName.first;
    String extendName = spltitedCinemaName.last;

    return Container(
      padding: this.padding ?? EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HeliosText(
            cityName,
            fontWeight: FontWeight.w400,
            height: this.height ?? 1.0,
          ),
          Text(
            "- Helios" + extendName,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
