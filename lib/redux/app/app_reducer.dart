import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/redux/home/home_reducer.dart';
import 'package:helios_app/redux/select_cinema/select_cinema_reducer.dart';

AppState appReducer(AppState state, action) {
  return state.copyWith(
    homeState: homeReducer(state.homeState, action),
    selectCinemaState: selectCinemaReducer(state.selectCinemaState, action),
  );
}
