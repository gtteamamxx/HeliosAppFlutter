import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/other/helpers/navigator_helper.dart';
import 'package:helios_app/other/service_locator.dart';
import 'package:helios_app/redux/actions/app/change_app_bar_visibility_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/src/store.dart';

StreamSubscription<ConnectivityResult> connectivitySubscription;
ConnectivityResult connectivityState;

startNetworkWatcher() async {
  connectivityState = await Connectivity().checkConnectivity();
  connectivitySubscription = Connectivity().onConnectivityChanged.listen(
    (ConnectivityResult state) {
      connectivityState = state;
      _watchState(state);
    },
  );
}

_watchState(state) {
  if (state == ConnectivityResult.none) {
    Future.delayed(Duration(seconds: 5), () {
      if (connectivityState == ConnectivityResult.none) {
        NavigatorHelper.navigatorKey.currentState.push(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              Store<AppState> store = StoreProvider.of<AppState>(context);
              store.dispatch(ChangeAppBarVisibilityAction(isVisible: false));
              return Container(child: Text("nie masz polaczenia"));
            }));
      }
    });
  }
}
