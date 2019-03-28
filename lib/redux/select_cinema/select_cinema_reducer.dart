import 'package:helios_app/redux/actions/select_cinema/FetchCinemasAction.dart';
import 'package:helios_app/redux/actions/select_cinema/FinishFetchCinemasAction.dart';
import 'package:helios_app/redux/select_cinema/select_cinema_state.dart';

SelectCinemaState selectCinemaReducer(SelectCinemaState state, dynamic action) {
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
