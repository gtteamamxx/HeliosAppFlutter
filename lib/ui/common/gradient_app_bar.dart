import "package:flutter/material.dart";
import 'package:helios_app/resources/helios_fonts/helios_icons_icons.dart';

class GradientAppBar extends StatelessWidget {
  GradientAppBar({
    this.title,
    this.colorFrom,
    this.colorTo,
    this.barHeight = 50,
    this.titleStyle,
    this.showChangeCinemaButton,
    this.showBackButton,
    this.changeCinemaTap,
    this.backButtonTap,
  });

  final String title;
  final double barHeight;
  final Color colorFrom;
  final Color colorTo;
  final TextStyle titleStyle;
  final bool showChangeCinemaButton;
  final bool showBackButton;
  final VoidCallback changeCinemaTap;
  final VoidCallback backButtonTap;

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Material(
      child: Container(
        padding: EdgeInsets.only(top: statusbarHeight, left: 15),
        height: statusbarHeight + this.barHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            this.showBackButton
                ? Container(
                    margin: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: this.backButtonTap,
                      child: Icon(
                        HeliosIcons.left_arrow_icon,
                        size: 30,
                      ),
                    ))
                : Container(),
            Expanded(
              flex: 9,
              child: Material(
                color: Colors.transparent,
                child: Text(
                  this.title,
                  style: this.titleStyle,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            this.showChangeCinemaButton
                ? Expanded(
                    flex: 2,
                    child: Container(
                      height: statusbarHeight + this.barHeight,
                      child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(45)),
                          customBorder: InputBorder.none,
                          child: Icon(HeliosIcons.pinned_city_icon, size: 30),
                          onTap: this.changeCinemaTap),
                    ))
                : Container(width: 0, height: 0)
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [this.colorFrom, this.colorTo],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
      ),
    );
  }
}
