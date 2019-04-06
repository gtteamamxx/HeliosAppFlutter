import 'package:flutter/material.dart';
import 'package:helios_app/ui/common/helios_button.dart';
import 'package:helios_app/ui/common/helios_text.dart';

class ErrorButton extends StatelessWidget {
  ErrorButton({
    this.refreshClick,
    this.title,
    this.content,
    this.fontSize = 16,
  });

  final VoidCallback refreshClick;
  final String title;
  final double fontSize;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HeliosText(
            this.title,
            fontSize: this.fontSize,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          HeliosButton(
            content: this.content ?? "Spróbuj ponownie",
            onTap: this.refreshClick,
          ),
        ],
      ),
    );
  }
}
