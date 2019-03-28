import 'package:helios_app/redux/home/home_state.dart';
import 'package:helios_app/redux/select_cinema/select_cinema_state.dart';
import 'package:helios_app/redux/select_cinema/select_cinema_middleware.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:helios_app/redux/app/app_reducer.dart';
import 'package:helios_app/redux/app/app_middleware.dart';

class AppState {
  AppState({
    @required this.homeState,
    @required this.selectCinemaState,
  });

  final HomeState homeState;
  final SelectCinemaState selectCinemaState;

  static AppState initial() {
    return AppState(
      homeState: HomeState.intiialState(),
      selectCinemaState: SelectCinemaState.initialState(),
    );
  }

  AppState copyWith({
    HomeState homeState,
    SelectCinemaState selectCinemaState,
  }) {
    return AppState(
      homeState: homeState ?? this.homeState,
      selectCinemaState: selectCinemaState ?? this.selectCinemaState,
    );
  }
}

Store<AppState> configureStore() {
  return Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      appMiddleware,
      selectCinemaMiddleware,
    ],
  );
}
