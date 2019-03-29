import 'package:helios_app/other/service_locator.dart';
import 'package:helios_app/other/services/abstract/cinema_service.dart';
import 'package:helios_app/redux/actions/select_cinema/fetch_cinemas_action.dart';
import 'package:helios_app/redux/actions/select_cinema/finish_fetch_cinemas_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void selectCinemaMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  if (action is FetchCinemasAction) {
    _fetchCinemas(action, next);
  } else {
    next(action);
  }
}

_fetchCinemas(FetchCinemasAction action, NextDispatcher next) {
  CinemaService cinemaService = serviceLocator.get<CinemaService>();

  next(action);

  cinemaService
      .getListOfCinemas(action.searchText)
      .then((cinemas) => next(FinishFetchCinemasAction(cinemas: cinemas)))
      .catchError((_) => next(FinishFetchCinemasAction()));
}
