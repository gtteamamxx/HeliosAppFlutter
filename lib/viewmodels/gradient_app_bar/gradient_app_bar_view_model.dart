import 'package:flutter/material.dart';
import 'package:helios_app/redux/actions/navigate_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class GradientAppBarViewModel {
  GradientAppBarViewModel({
    this.title,
    this.showChangeCinemaButton,
    this.onChangeCinemaTap,
  });

  final String title;
  final bool showChangeCinemaButton;
  final VoidCallback onChangeCinemaTap;

  static GradientAppBarViewModel fromStore(Store<AppState> store) {
    return GradientAppBarViewModel(
      title: store.state.appBarTitle,
      showChangeCinemaButton: store.state.showChangeCinemaButton,
      onChangeCinemaTap: () => _showChangeCinemaPage(store),
    );
  }

  static void _showChangeCinemaPage(Store<AppState> store) {
    store.dispatch(NavigateAction(
      route: '/',
    ));
  }
}
