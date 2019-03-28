import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/resources/helios_fonts/helios_icons_icons.dart';
import 'package:helios_app/viewmodels/home/home_page_view_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageViewModel>(
      converter: (store) => HomePageViewModel.fromStore(store),
      builder: (context, viewModel) => Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: viewModel.getSelectedPageIndex(),
              items: [
                _buildNavigationBarItem(
                  title: "Główna",
                  icon: HeliosIcons.home_icon,
                ),
                _buildNavigationBarItem(
                  title: "Cennik",
                  icon: HeliosIcons.pricing_icon,
                ),
                _buildNavigationBarItem(
                  title: "Repertuar",
                  icon: HeliosIcons.repertoire_icon,
                ),
                _buildNavigationBarItem(
                  title: "Więcej",
                  icon: HeliosIcons.more_icon,
                ),
              ],
              onTap: (index) => viewModel.onChangePage(index),
            ),
            body: Container(
              child: Center(
                child: Text("zawartosc"),
              ),
            ),
          ),
    );
  }

  _buildNavigationBarItem({String title, IconData icon}) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      activeIcon: Icon(
        icon,
        color: Color.fromARGB(255, 0, 0, 255),
      ),
      title: Text(title),
    );
  }
}
