import 'package:helios_app/other/service_locator.dart';
import 'package:helios_app/other/services/abstract/cinema_service.dart';
import 'package:helios_app/redux/actions/movie_detail/error_fetching_concrete_repertoire_action.dart';
import 'package:helios_app/redux/actions/movie_detail/fetch_concrete_repertoire_action.dart';
import 'package:helios_app/redux/actions/movie_detail/finish_fetch_concrete_repertoire_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void movieDetailPageStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) {
  if (action is FetchConcreteRepertoireAction) {
    _fetchConcreteRepertoireAction(action, next);
  }

  next(action);
}

_fetchConcreteRepertoireAction(
    FetchConcreteRepertoireAction action, NextDispatcher next) {
  var cinmeaService = serviceLocator.get<CinemaService>();

  cinmeaService
      .getRepertoireById(action.repertoireId)
      .then(
          (repertoire) => next(FinishFetchConcreteRepertoireAction(repertoire)))
      .catchError((_) => next(ErrorFetchingConcreteRepertoireAction()));
}
