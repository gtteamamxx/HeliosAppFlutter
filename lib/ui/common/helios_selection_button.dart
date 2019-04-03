import 'package:flutter/material.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';

class HeliosSelectionButton extends StatelessWidget {
  HeliosSelectionButton({
    this.isSelected,
    this.onTap,
    this.title,
    this.child,
    this.margin,
    this.padding,
    this.staticBackgroundColor = false,
  }) {
    if (title != null && child != null) {
      assert(child == null);
    }
  }

  final bool isSelected;
  final VoidCallback onTap;
  final String title;
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool staticBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: this.margin ?? EdgeInsets.symmetric(vertical: 10),
      padding: this.padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: isSelected ? Colors.white : Colors.transparent,
          width: 2,
        ),
        color: isSelected || this.staticBackgroundColor
            ? HeliosColors.backgroundFourth
            : Colors.transparent,
      ),
      child: InkWell(
        onTap: () {
          this.onTap();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Center(
            child: this.title != null
                ? Text(
                    this.title,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w100,
                    ),
                  )
                : this.child,
          ),
        ),
      ),
    );
  }
}
