import 'package:flutter/material.dart';
import 'package:helios_app_flutter_x/other/helpers/helios_colors.dart';
import 'package:helios_app_flutter_x/ui/common/helios_text.dart';

class HeliosButton extends StatelessWidget {
  HeliosButton({
    @required this.onTap,
    @required this.content,
  });

  final VoidCallback onTap;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            offset: Offset(1, 3),
            blurRadius: 5.0,
            spreadRadius: 1.5,
          ),
        ],
        gradient: LinearGradient(
          colors: [HeliosColors.appBarLeft, HeliosColors.appBarRight],
          begin: const FractionalOffset(-0.5, 0.0),
          end: const FractionalOffset(0.8, 0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: TextButton(
        onPressed: () => this.onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: HeliosText(
            content,
            textAlign: TextAlign.center,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
