import 'package:helios_app_flutter_x/other/service_locator.dart';
import 'package:helios_app_flutter_x/other/services/abstract/cinema_service.dart';
import 'package:helios_app_flutter_x/redux/actions/movie_detail/error_fetching_movie_repertoire_action.dart';
import 'package:helios_app_flutter_x/redux/actions/movie_detail/fetch_movie_repertoire_action.dart';
import 'package:helios_app_flutter_x/redux/actions/movie_detail/finish_fetch_movie_repertoire_action.dart';
import 'package:helios_app_flutter_x/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void movieDetailPageStateMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is FetchMovieRepertoireAction) {
    _fetchMovieRepertoire(action, next, store);
  }

  next(action);
}

_fetchMovieRepertoire(FetchMovieRepertoireAction action, NextDispatcher next, Store<AppState> store) {
  var cinmeaService = serviceLocator.get<CinemaService>();

  cinmeaService
      .getMovieRepertoireForToday(
        movieId: action.movieId,
        cinemaId: store.state.selectedCinema.id,
      )
      .then((movieRepertoire) => next(FinishFetchMovieRepertoireAction(movieRepertoire)))
      .catchError((_) => next(ErrorFetchingMovieRepertoireAction()));
}
