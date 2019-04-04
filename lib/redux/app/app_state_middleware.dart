import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/other/helpers/navigator_helper.dart';
import 'package:helios_app/other/service_locator.dart';
import 'package:helios_app/other/services/navigation_service.dart';
import 'package:helios_app/redux/actions/app/change_visibility_back_button_action.dart';
import 'package:helios_app/redux/actions/movie_detail/fetch_concrete_repertoire_action.dart';
import 'package:helios_app/redux/actions/navigate_action.dart';
import 'package:helios_app/redux/actions/show_movie_detail_action.dart';
import 'package:helios_app/redux/actions/movie_detail/finish_fetch_concrete_repertoire_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void appStateMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  if (action is NavigateAction) {
    _navigateByRoute(action);
  } else if (action is ShowMovieDetailAction) {
    _showMovieDetails(store, action.repertoire);
  } else if (action is ShowMovieDetailByIdAction) {
    _showMovieDetails(store, action.repertoireId);
  } else {
    next(action);
  }
}

void _showMovieDetails(Store<AppState> store, Object arguments) {
  if (arguments is RepertoireModel) {
    store.dispatch(FinishFetchConcreteRepertoireAction(arguments));
  } else {
    store.dispatch(FetchConcreteRepertoireAction(arguments as int));
  }

  store.dispatch(ChangeVisibilityOfBackButtonAction(isVisible: true));
  NavigatorHelper.navigatorKey.currentState.pushNamed('/movie-detail');
}

_navigateByRoute(NavigateAction navigateAction) {
  var navigationService = serviceLocator.get<NavigationService>();
  navigationService.navigateTo(navigateAction.route);
}
