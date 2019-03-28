import "package:flutter/material.dart";

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight;
  final Color colorFrom;
  final Color colorTo;
  final TextStyle titleStyle;

  GradientAppBar({
    this.title,
    this.colorFrom,
    this.colorTo,
    this.barHeight = 50,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight + 10, left: 15),
      height: statusbarHeight + barHeight,
      child: Text(
        title,
        style: titleStyle,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorFrom, colorTo],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.5, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}
