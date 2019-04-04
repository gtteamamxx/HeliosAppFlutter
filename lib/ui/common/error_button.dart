import 'package:flutter/material.dart';
import 'package:helios_app/ui/common/helios_button.dart';

class ErrorButton extends StatelessWidget {
  ErrorButton({
    this.refreshClick,
    this.title,
    this.fontSize = 16,
  });

  final VoidCallback refreshClick;
  final String title;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(fontFamily: "Poppins", fontSize: this.fontSize),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          HeliosButton(content: "Spróbuj ponownie", onTap: this.refreshClick),
        ],
      ),
    );
  }
}
