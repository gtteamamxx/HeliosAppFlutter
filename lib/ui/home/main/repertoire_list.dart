import 'package:flutter/material.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';

class RepertoireList extends StatelessWidget {
  RepertoireList({this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          _buildButtons(),
        ],
      ),
    );
  }

  _buildButtons() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildButton("Do południa"),
          _buildButton("Po południu"),
          _buildButton("Wieczorem"),
        ],
      ),
    );
  }

  _buildButton(String title) {
    bool isSelected = title == "Po południu";

    return Expanded(
      child: Container(
        height: 40,
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                color: isSelected
                    ? HeliosColors.backgroundPrimary.withAlpha(150)
                    : Colors.transparent,
              )
            : null,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildTitle() {
    return Row(
      children: [
        Text(
          "Repertuar",
          style: TextStyle(fontFamily: "Poppins", fontSize: 24),
        ),
        SizedBox(width: 5),
        Text(
          "|",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w100,
          ),
        ),
        SizedBox(width: 5),
        Text(
          "Środa 23.01",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 17,
            fontWeight: FontWeight.w100,
          ),
        ),
      ],
    );
  }
}
