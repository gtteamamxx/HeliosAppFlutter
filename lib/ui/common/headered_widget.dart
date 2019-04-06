import 'package:flutter/material.dart';
import 'package:helios_app/ui/common/helios_text.dart';

class HeaderedWidget extends StatelessWidget {
  HeaderedWidget({
    @required this.child,
    @required this.title,
    @required this.backgroundColor,
    this.additionalChild,
    this.buttonText,
    this.onButtonTap,
  }) {
    if (this.additionalChild != null) {
      assert(this.buttonText == null);
      assert(this.onButtonTap == null);
    } else if (this.buttonText != null) {
      assert(this.onButtonTap != null);
    }
  }

  final Widget child;
  final String title;
  final Widget additionalChild;
  final Color backgroundColor;
  final String buttonText;
  final VoidCallback onButtonTap;

  final padding = EdgeInsets.all(10);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: this.padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                HeliosText(
                  this.title,
                  fontSize: 22,
                ),
                this.additionalChild ?? _buildButton() ?? Container(),
              ],
            ),
          ),
          this.child,
        ],
      ),
    );
  }

  _buildButton() {
    if (this.buttonText == null) {
      return null;
    }

    return Container(
      child: InkWell(
        onTap: () => this.onButtonTap(),
        child: HeliosText(
          this.buttonText,
          textDecoration: TextDecoration.underline,
          fontSize: 14,
        ),
      ),
    );
  }
}
