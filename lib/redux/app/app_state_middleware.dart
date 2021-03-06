import 'package:helios_app_flutter_x/other/helpers/navigator_helper.dart';
import 'package:helios_app_flutter_x/other/service_locator.dart';
import 'package:helios_app_flutter_x/other/services/navigation_service.dart';
import 'package:helios_app_flutter_x/redux/actions/app/change_app_bar_visibility_action.dart';
import 'package:helios_app_flutter_x/redux/actions/app/change_visibility_back_button_action.dart';
import 'package:helios_app_flutter_x/redux/actions/movie_detail/fetch_movie_repertoire_action.dart';
import 'package:helios_app_flutter_x/redux/actions/navigate_action.dart';
import 'package:helios_app_flutter_x/redux/actions/show_image_action.dart';
import 'package:helios_app_flutter_x/redux/actions/show_movie_detail_action.dart';
import 'package:helios_app_flutter_x/redux/actions/show_select_places_action.dart';
import 'package:helios_app_flutter_x/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void appStateMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) {
  if (action is NavigateAction) {
    _navigateByRoute(action);
  } else if (action is ShowMovieDetailAction) {
    _showMovieDetails(store, action.movieRepertoire.movie.id);
  } else if (action is ShowMovieDetailByIdAction) {
    _showMovieDetails(store, action.movieId);
  } else if (action is ShowImageAction) {
    _showImage(store, action);
  } else if (action is ShowSelectPlacesAction) {
    _showSelectPlacesAction(store, action);
  } else {
    next(action);
  }
}

void _showSelectPlacesAction(Store<AppState> store, ShowSelectPlacesAction action) {
  _navigateByRoute(NavigateAction(route: '/select-places'));
}

void _showImage(Store<AppState> store, ShowImageAction action) {
  store.dispatch(ChangeAppBarVisibilityAction(isVisible: false));
  _navigateByRoute(NavigateAction(
    route: '/image-details',
    arguments: action.imageUrl,
  ));
}

void _showMovieDetails(Store<AppState> store, int movieId) {
  store.dispatch(FetchMovieRepertoireAction(movieId: movieId));

  store.dispatch(ChangeVisibilityOfBackButtonAction(
    isVisible: true,
    backAction: () {
      _popWithHide(store);
    },
  ));

  _navigateByRoute(NavigateAction(route: '/movie-detail'));
}

void _popWithHide(Store<AppState> store) {
  NavigatorHelper.navigatorKey.currentState.maybePop();
  store.dispatch(ChangeVisibilityOfBackButtonAction(isVisible: false, backAction: null));
}

_navigateByRoute(NavigateAction navigateAction) {
  var navigationService = serviceLocator.get<NavigationService>();
  navigationService.navigateTo(navigateAction.route, navigateAction.arguments);
}
