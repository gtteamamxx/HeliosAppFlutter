import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/redux/actions/app/change_app_bar_title_action.dart';
import 'package:helios_app/redux/actions/app/change_visiblity_change_cinema_button_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/resources/helios_fonts/helios_icons_icons.dart';
import 'package:helios_app/viewmodels/home/home_page_view_model.dart';
import 'package:flushbar/flushbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Duration timeUntilUserCanCloseApp = Duration(seconds: 2);
  bool _shouldCloseApp = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageViewModel>(
      converter: (store) => HomePageViewModel.fromStore(store),
      onInit: (store) {
        store
            .dispatch(ChangeAppBarTitleAction(store.state.selectedCinema.name));
        store.dispatch(
            ChangeVisibilityOfChangeCinemaButtonAction(isVisible: true));
      },
      builder: (context, viewModel) => Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: viewModel.getSelectedPageIndex(),
              items: [
                _buildNavigationBarItem(
                    title: "Główna", icon: HeliosIcons.home_icon),
                _buildNavigationBarItem(
                    title: "Cennik", icon: HeliosIcons.pricing_icon),
                _buildNavigationBarItem(
                    title: "Repertuar", icon: HeliosIcons.repertoire_icon),
                _buildNavigationBarItem(
                    title: "Więcej", icon: HeliosIcons.more_icon)
              ],
              onTap: (index) => viewModel.onChangePage(index),
            ),
            body: WillPopScope(
              onWillPop: () => _closeAppWhenRequest(context),
              child: Container(),
            ),
          ),
    );
  }

  Future<bool> _closeAppWhenRequest(BuildContext context) {
    _shouldCloseApp = true;

    Future.delayed(timeUntilUserCanCloseApp, () {
      _shouldCloseApp = false;
    });

    Flushbar(
      message: "Naciśnij wstecz jeszcze raz, aby wyjśc z aplikacji",
      duration: timeUntilUserCanCloseApp,
      flushbarPosition: FlushbarPosition.BOTTOM,
      backgroundColor: Colors.blue,
      animationDuration: Duration(milliseconds: 200),
    )
      ..onStatusChanged = (status) {
        if (status == FlushbarStatus.DISMISSED) {
          if (_shouldCloseApp) {
            SystemNavigator.pop();
          }
        }
      }
      ..show(context);

    return Future.value(false);
  }

  _buildNavigationBarItem({String title, IconData icon}) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: Color.fromARGB(255, 255, 255, 255)),
      activeIcon: Icon(icon, color: Color.fromARGB(255, 0, 0, 255)),
      title: Text(title),
    );
  }
}
