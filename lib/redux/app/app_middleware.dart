import 'package:helios_app/other/service_locator.dart';
import 'package:helios_app/other/services/navigation_service.dart';
import 'package:helios_app/redux/actions/navigate_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void appMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) {
  if (action is NavigateAction) {
    _navigateByRoute(action);
  } else {
    next(action);
  }
}

_navigateByRoute(NavigateAction navigateAction) {
  var navigationService = serviceLocator.get<NavigationService>();
  navigationService.navigateTo(navigateAction.context, navigateAction.route);
}
