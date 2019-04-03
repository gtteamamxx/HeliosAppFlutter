import 'package:helios_app/other/service_locator.dart';
import 'package:helios_app/other/services/abstract/cinema_service.dart';
import 'package:helios_app/redux/actions/home/repertoire/error_fetching_repertoire_action.dart';
import 'package:helios_app/redux/actions/home/repertoire/fetch_repertoire_action.dart';
import 'package:helios_app/redux/actions/home/repertoire/finish_fetch_repertoire_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void repertoirePageStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) {
  if (action is FetchRepertoireAction) {
    _fetchRepertoireAction(store, next);
  }
  next(action);
}

void _fetchRepertoireAction(Store<AppState> store, NextDispatcher next) {
  var cinemaService = serviceLocator.get<CinemaService>();

  cinemaService
      .getRepertoireForCinema(store.state.selectedCinema.id)
      .then((repertoire) =>
          next(FinishFetchRepertoireAction(repertoire: repertoire)))
      .catchError((_) => next(ErrorFetchingRepertoireAction()));
}
