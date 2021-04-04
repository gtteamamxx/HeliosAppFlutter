import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app_flutter_x/other/helpers/helios_colors.dart';
import 'package:helios_app_flutter_x/other/helpers/navigator_helper.dart';
import 'package:helios_app_flutter_x/redux/actions/app/change_app_bar_visibility_action.dart';
import 'package:helios_app_flutter_x/redux/app/app_state.dart';
import 'package:helios_app_flutter_x/ui/common/error_button.dart';
import 'package:redux/redux.dart';

StreamSubscription<ConnectivityResult> connectivitySubscription;
ConnectivityResult connectivityState;

startNetworkWatcher() async {
  connectivitySubscription = Connectivity().onConnectivityChanged.listen(
    (ConnectivityResult state) {
      connectivityState = state;
      _watchState(state);
    },
  );

  connectivityState = await Connectivity().checkConnectivity();
  _watchState(connectivityState);
}

_watchState(state) {
  if (state == ConnectivityResult.none) {
    Future.delayed(Duration(seconds: 5), () {
      if (connectivityState == ConnectivityResult.none) {
        NavigatorHelper.navigatorKey.currentState.push(
          MaterialPageRoute(
            maintainState: true,
            fullscreenDialog: true,
            builder: (context) {
              Store<AppState> store = StoreProvider.of<AppState>(context);
              store.dispatch(ChangeAppBarVisibilityAction(isVisible: false));
              return WillPopScope(
                onWillPop: () => Future.value(connectivityState != ConnectivityResult.none),
                child: Material(
                  color: HeliosColors.backgroundFifth,
                  child: ErrorButton(
                    title: "Wygląda na to, żę nie masz połączenia",
                    content: "Sprawdź połączenie",
                    refreshClick: () {
                      if (connectivityState != ConnectivityResult.none) {
                        NavigatorHelper.navigatorKey.currentState.pop();
                        store.dispatch(ChangeAppBarVisibilityAction(isVisible: true));
                      }
                    },
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
