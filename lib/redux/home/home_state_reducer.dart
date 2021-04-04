import 'package:helios_app_flutter_x/redux/actions/home/change_home_page_action.dart';
import 'package:helios_app_flutter_x/redux/home/home_state.dart';
import 'package:helios_app_flutter_x/redux/home/main/main_page_state_reducer.dart';
import 'package:helios_app_flutter_x/redux/home/repertoire/repertoire_page_state_reducer.dart';

import 'pricing/pricing_page_state_reducer.dart';

HomeState homeStateReducer(HomeState state, action) {
  if (action is ChangeHomePageAction) {
    return state.copyWith(selectedPage: action.page);
  }

  return state.copyWith(
    mainPageState: mainPageStateReducer(state.mainPageState, action),
    pricingPageState: pricingPageStateReducer(state.pricingPageState, action),
    repertoirePageState: repertoirePageStateReducer(state.repertoirePageState, action),
  );
}
