import 'package:flutter/material.dart';
import 'package:helios_app/redux/actions/navigate_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class GradientAppBarViewModel {
  GradientAppBarViewModel({
    this.title,
    this.showChangeCinemaButton,
    this.onChangeCinemaTap,
    this.isVisible,
    this.showBackButton,
    this.onBackButtonPressed,
  });

  final String title;
  final bool showChangeCinemaButton;
  final bool showBackButton;
  final VoidCallback onChangeCinemaTap;
  final bool isVisible;
  final VoidCallback onBackButtonPressed;

  static GradientAppBarViewModel fromStore(Store<AppState> store) {
    return GradientAppBarViewModel(
      title: store.state.appBarTitle,
      showChangeCinemaButton: store.state.showChangeCinemaButton,
      isVisible: store.state.isAppBarVisible,
      showBackButton: store.state.showBackButton,
      onChangeCinemaTap: () => _showChangeCinemaPage(store),
      onBackButtonPressed: () => _backButtonPressed(store),
    );
  }

  static void _showChangeCinemaPage(Store<AppState> store) {
    store.dispatch(NavigateAction(route: '/'));
  }

  static void _backButtonPressed(Store<AppState> store) {
    if (store.state.backAction != null) {
      store.state.backAction();
    }
  }
}
