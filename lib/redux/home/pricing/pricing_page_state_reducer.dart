import 'package:helios_app_flutter_x/redux/actions/home/pricing/error_fetching_pricing_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/pricing/fetch_pricing_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/pricing/finish_fetch_pricing_action.dart';
import 'package:helios_app_flutter_x/redux/home/pricing/pricing_page_state.dart';

PricingPageState pricingPageStateReducer(PricingPageState state, action) {
  if (action is FetchPricingAction) {
    return state.copyWith(
      isLoading: true,
      isError: false,
      pricing: [],
    );
  } else if (action is FinishFetchPricingAction) {
    return state.copyWith(
      isLoading: false,
      isError: false,
      pricing: action.pricing,
    );
  } else if (action is ErrorFetchingPricingAction) {
    return state.copyWith(
      isLoading: false,
      isError: true,
      pricing: [],
    );
  }

  return state;
}
