import 'package:helios_app_flutter_x/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void selectPlacesPageStatesMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) {
  next(action);
}
