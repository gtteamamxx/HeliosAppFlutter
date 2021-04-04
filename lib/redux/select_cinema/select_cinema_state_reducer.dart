import 'package:helios_app_flutter_x/redux/actions/select_cinema/fetch_cinemas_action.dart';
import 'package:helios_app_flutter_x/redux/actions/select_cinema/finish_fetch_cinemas_action.dart';
import 'package:helios_app_flutter_x/redux/select_cinema/select_cinema_state.dart';

SelectCinemaState selectCinemaStateReducer(SelectCinemaState state, dynamic action) {
  if (action is FetchCinemasAction) {
    return state.copyWith(isLoading: true);
  } else if (action is FinishFetchCinemasAction) {
    return state.copyWith(
      isLoading: false,
      cinemas: action.cinemas ?? [],
    );
  }

  return state;
}
