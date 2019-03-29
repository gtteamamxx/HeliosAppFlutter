import 'package:helios_app/models/cinema/cinema_model.dart';
import 'package:helios_app/redux/home/home_state.dart';
import 'package:helios_app/redux/select_cinema/select_cinema_state.dart';
import 'package:helios_app/redux/select_cinema/select_cinema_middleware.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:helios_app/redux/app/app_reducer.dart';
import 'package:helios_app/redux/app/app_middleware.dart';

class AppState {
  AppState({
    @required this.appBarTitle,
    @required this.showChangeCinemaButton,
    @required this.homeState,
    @required this.selectCinemaState,
    @required this.selectedCinema,
  });

  final String appBarTitle;
  final HomeState homeState;
  final SelectCinemaState selectCinemaState;
  final CinemaModel selectedCinema;
  final bool showChangeCinemaButton;

  static AppState initial() {
    return AppState(
      homeState: HomeState.intiialState(),
      selectCinemaState: SelectCinemaState.initialState(),
      selectedCinema: null,
      appBarTitle: "",
      showChangeCinemaButton: false,
    );
  }

  AppState copyWith({
    HomeState homeState,
    SelectCinemaState selectCinemaState,
    CinemaModel selectedCinema,
    String appBarTitle,
    bool showChangeCinemaButton,
  }) {
    return AppState(
      homeState: homeState ?? this.homeState,
      selectCinemaState: selectCinemaState ?? this.selectCinemaState,
      selectedCinema: selectedCinema ?? this.selectedCinema,
      appBarTitle: appBarTitle ?? this.appBarTitle,
      showChangeCinemaButton:
          showChangeCinemaButton ?? this.showChangeCinemaButton,
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
