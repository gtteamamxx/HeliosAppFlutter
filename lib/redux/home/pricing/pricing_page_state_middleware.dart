import 'package:helios_app_flutter_x/other/service_locator.dart';
import 'package:helios_app_flutter_x/other/services/abstract/cinema_service.dart';
import 'package:helios_app_flutter_x/redux/actions/home/pricing/error_fetching_pricing_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/pricing/fetch_pricing_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/pricing/finish_fetch_pricing_action.dart';
import 'package:helios_app_flutter_x/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void pricingPageStateMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is FetchPricingAction) {
    _fetchPricing(store, next);
  }

  next(action);
}

_fetchPricing(Store<AppState> store, NextDispatcher next) {
  var cinemaService = serviceLocator.get<CinemaService>();

  cinemaService
      .getPricingForCinema(store.state.selectedCinema.id)
      .then((pricing) => next(FinishFetchPricingAction(pricing: pricing)))
      .catchError((_) => next(ErrorFetchingPricingAction()));
}
