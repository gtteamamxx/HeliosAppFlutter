import 'package:helios_app/models/cinema/cinema_model.dart';
import 'package:helios_app/redux/home/home_state.dart';
import 'package:helios_app/redux/select_cinema/select_cinema_state.dart';
import 'package:helios_app/redux/select_cinema/select_cinema_state_middleware.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:helios_app/redux/app/app_state_reducer.dart';
import 'package:helios_app/redux/app/app_state_middleware.dart';
import 'package:helios_app/redux/home/main/main_page_state_middleware.dart';
import 'package:helios_app/redux/home/pricing/pricing_page_state_middleware.dart';
import 'package:helios_app/redux/home/repertoire/repertoire_page_state_middleware.dart';

class AppState {
  AppState({
    @required this.appBarTitle,
    @required this.showChangeCinemaButton,
    @required this.homeState,
    @required this.selectCinemaState,
    @required this.selectedCinema,
    @required this.isAppBarVisible,
  });

  final String appBarTitle;
  final HomeState homeState;
  final SelectCinemaState selectCinemaState;
  final CinemaModel selectedCinema;
  final bool showChangeCinemaButton;
  final bool isAppBarVisible;

  static AppState initial() {
    return AppState(
      homeState: HomeState.intiialState(),
      selectCinemaState: SelectCinemaState.initialState(),
      selectedCinema: null,
      appBarTitle: "",
      showChangeCinemaButton: false,
      isAppBarVisible: true,
    );
  }

  AppState copyWith({
    HomeState homeState,
    SelectCinemaState selectCinemaState,
    CinemaModel selectedCinema,
    String appBarTitle,
    bool showChangeCinemaButton,
    bool isAppBarVisible,
  }) {
    return AppState(
      homeState: homeState ?? this.homeState,
      selectCinemaState: selectCinemaState ?? this.selectCinemaState,
      selectedCinema: selectedCinema ?? this.selectedCinema,
      appBarTitle: appBarTitle ?? this.appBarTitle,
      showChangeCinemaButton:
          showChangeCinemaButton ?? this.showChangeCinemaButton,
      isAppBarVisible: isAppBarVisible ?? this.isAppBarVisible,
    );
  }
}

Store<AppState> configureStore() {
  return Store<AppState>(
    appStateReducer,
    initialState: AppState.initial(),
    middleware: [
      appStateMiddleware,
      selectCinemaStateMiddleware,
      mainPageStateMiddleware,
      pricingPageStateMiddleware,
      repertoirePageStateMiddleware,
    ],
  );
}
