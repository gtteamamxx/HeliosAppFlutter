import 'package:flutter/material.dart';
import 'package:helios_app/ui/common/gradient_app_bar.dart';
import 'package:helios_app/helpers/colors_helper.dart';

class SelectCinemaPage extends StatefulWidget {
  SelectCinemaPage({Key key}) : super(key: key);

  _SelectCinemaPageState createState() => _SelectCinemaPageState();
}

class _SelectCinemaPageState extends State<SelectCinemaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(getColorHexFromStr("#3e5275")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildAppBar(),
          _buildSearchCinemaTextField(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text("test", style: TextStyle(fontSize: 18)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildAppBar() {
    return GradientAppBar(
      title: "Które kino chcesz odwiedzić?",
      colorFrom: Color(getColorHexFromStr("#2A5495")),
      colorTo: Color(getColorHexFromStr("#0D2A5A")),
      titleStyle: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w100,
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }

  _buildSearchCinemaTextField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Material(
        color: Colors.transparent,
        child: TextField(
          style: TextStyle(color: Colors.black45, fontSize: 20),
          decoration: InputDecoration(
            hintText: "Szukaj",
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(20),
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
            filled: true,
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }
}
