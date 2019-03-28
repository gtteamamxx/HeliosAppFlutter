import 'package:flutter/material.dart';

class SelectCinemaPage extends StatefulWidget {
  SelectCinemaPage({Key key}) : super(key: key);

  _SelectCinemaPageState createState() => _SelectCinemaPageState();
}

class _SelectCinemaPageState extends State<SelectCinemaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Które kino chcesz odwiedzić?",
          textAlign: TextAlign.left,
          style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w100),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: "Szukaj"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) {
                return Text("test");
              },
            ),
          )
        ],
      ),
    );
  }
}
