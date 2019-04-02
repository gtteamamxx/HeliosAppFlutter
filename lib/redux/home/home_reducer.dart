import 'package:helios_app/redux/actions/home/change_home_page_action.dart';
import 'package:helios_app/redux/home/home_state.dart';
import 'package:helios_app/redux/home/main/main_page_state_reducer.dart';
import 'package:helios_app/redux/home/pricing/pricing_page_reducer.dart';

HomeState homeReducer(HomeState state, action) {
  if (action is ChangeHomePageAction) {
    return state.copyWith(selectedPage: action.page);
  }

  return state.copyWith(
    mainPageState: mainPageStateReducer(state.mainPageState, action),
    pricingPageState: pricingPageStateReducer(state.pricingPageState, action),
  );
}
