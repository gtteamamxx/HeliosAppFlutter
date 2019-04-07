import 'package:helios_app/other/service_locator.dart';
import 'package:helios_app/other/services/abstract/cinema_service.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void selectPlacesPageStatesMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  next(action);
}
