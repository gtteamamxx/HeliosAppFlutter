import 'package:helios_app/redux/actions/change_home_page_action.dart';
import 'package:helios_app/redux/home/home_state.dart';

HomeState homeReducer(
  HomeState state,
  action,
) {
  if (action is ChangeHomePageAction) {
    return state.copyWith(
      selectedPage: action.page,
    );
  }

  return state;
}
