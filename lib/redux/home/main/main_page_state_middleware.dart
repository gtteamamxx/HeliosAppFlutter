import 'package:helios_app/other/service_locator.dart';
import 'package:helios_app/other/services/abstract/cinema_service.dart';
import 'package:helios_app/redux/actions/home/main/fetch_featured_movies_action.dart';
import 'package:helios_app/redux/actions/home/main/finish_fetch_featured_movies.action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void mainPageStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) {
  if (action is FetchFeaturedMoviesAction) {
    _fetchFeaturedMoviesAction(store, next);
  }
  next(action);
}

void _fetchFeaturedMoviesAction(Store<AppState> store, NextDispatcher next) {
  var cinemaService = serviceLocator.get<CinemaService>();

  cinemaService
      .getFeaturedMovies()
      .then((featuredMovies) =>
          store.dispatch(FinishFetchFeaturedMoviesAction(featuredMovies)))
      .catchError((_) => store.dispatch(FinishFetchFeaturedMoviesAction([])));
}
