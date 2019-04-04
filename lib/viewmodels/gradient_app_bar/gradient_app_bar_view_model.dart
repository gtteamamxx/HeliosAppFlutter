import 'package:flutter/material.dart';
import 'package:helios_app/redux/actions/app/change_visibility_back_button_action.dart';
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
    this.hideBackButton,
  });

  final String title;
  final bool showChangeCinemaButton;
  final bool showBackButton;
  final VoidCallback onChangeCinemaTap;
  final bool isVisible;
  final VoidCallback hideBackButton;

  static GradientAppBarViewModel fromStore(Store<AppState> store) {
    return GradientAppBarViewModel(
      title: store.state.appBarTitle,
      showChangeCinemaButton: store.state.showChangeCinemaButton,
      isVisible: store.state.isAppBarVisible,
      showBackButton: store.state.showBackButton,
      onChangeCinemaTap: () => _showChangeCinemaPage(store),
      hideBackButton: () => _hideBackButton(store),
    );
  }

  static void _showChangeCinemaPage(Store<AppState> store) {
    store.dispatch(NavigateAction(route: '/'));
  }

  static void _hideBackButton(Store<AppState> store) {
    store.dispatch(ChangeVisibilityOfBackButtonAction(isVisible: false));
  }
}
