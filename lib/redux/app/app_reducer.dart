import 'package:helios_app/redux/actions/app/change_app_bar_title_action.dart';
import 'package:helios_app/redux/actions/app/change_visiblity_change_cinema_button_action.dart';
import 'package:helios_app/redux/actions/select_cinema/select_cinema_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/redux/home/home_reducer.dart';
import 'package:helios_app/redux/select_cinema/select_cinema_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SelectCinemaAction) {
    return state.copyWith(selectedCinema: action.cinema);
  } else if (action is ChangeAppBarTitleAction) {
    return state.copyWith(appBarTitle: action.title);
  } else if (action is ChangeVisibilityOfChangeCinemaButtonAction) {
    return state.copyWith(showChangeCinemaButton: action.isVisible);
  }

  return state.copyWith(
    homeState: homeReducer(state.homeState, action),
    selectCinemaState: selectCinemaReducer(state.selectCinemaState, action),
  );
}
