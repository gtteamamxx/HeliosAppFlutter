import 'package:helios_app_flutter_x/redux/actions/app/change_app_bar_title_action.dart';
import 'package:helios_app_flutter_x/redux/actions/app/change_app_bar_visibility_action.dart';
import 'package:helios_app_flutter_x/redux/actions/app/change_visibility_back_button_action.dart';
import 'package:helios_app_flutter_x/redux/actions/app/change_visiblity_change_cinema_button_action.dart';
import 'package:helios_app_flutter_x/redux/actions/select_cinema/select_cinema_action.dart';
import 'package:helios_app_flutter_x/redux/app/app_state.dart';
import 'package:helios_app_flutter_x/redux/home/home_state_reducer.dart';
import 'package:helios_app_flutter_x/redux/movie_detail/movie_detail_page_state_reducer.dart';
import 'package:helios_app_flutter_x/redux/select_cinema/select_cinema_state_reducer.dart';
import 'package:helios_app_flutter_x/redux/select_places/select_places_page_state_reducer.dart';

AppState appStateReducer(AppState state, dynamic action) {
  if (action is SelectCinemaAction) {
    return state.copyWith(selectedCinema: action.cinema);
  } else if (action is ChangeAppBarTitleAction) {
    return state.copyWith(appBarTitle: action.title);
  } else if (action is ChangeVisibilityOfChangeCinemaButtonAction) {
    return state.copyWith(showChangeCinemaButton: action.isVisible);
  } else if (action is ChangeAppBarVisibilityAction) {
    return state.copyWith(isAppBarVisible: action.isVisible);
  } else if (action is ChangeVisibilityOfBackButtonAction) {
    return state.copyWith(
      showBackButton: action.isVisible,
      backAction: action.backAction,
    );
  }

  return state.copyWith(
    homeState: homeStateReducer(state.homeState, action),
    selectCinemaState: selectCinemaStateReducer(state.selectCinemaState, action),
    movieDetailPageState: movieDetailPageStateReducer(state.movieDetailPageState, action),
    selectPlacesPageState: selectPlacesPageStateReducer(state.selectPlacesPageState, action),
  );
}
