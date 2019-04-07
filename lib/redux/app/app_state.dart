import 'package:flutter/material.dart';
import 'package:helios_app/models/cinema/cinema_model.dart';
import 'package:helios_app/redux/home/home_state.dart';
import 'package:helios_app/redux/movie_detail/movie_detail_page_state.dart';
import 'package:helios_app/redux/select_cinema/select_cinema_state.dart';
import 'package:helios_app/redux/select_cinema/select_cinema_state_middleware.dart';
import 'package:helios_app/redux/select_places/select_places_page_state.dart';
import 'package:helios_app/redux/select_places/select_places_page_state_middleware.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:helios_app/redux/app/app_state_reducer.dart';
import 'package:helios_app/redux/app/app_state_middleware.dart';
import 'package:helios_app/redux/home/main/main_page_state_middleware.dart';
import 'package:helios_app/redux/home/pricing/pricing_page_state_middleware.dart';
import 'package:helios_app/redux/home/repertoire/repertoire_page_state_middleware.dart';
import 'package:helios_app/redux/movie_detail/movie_detail_page_state_middleware.dart';

class AppState {
  AppState({
    @required this.appBarTitle,
    @required this.showChangeCinemaButton,
    @required this.homeState,
    @required this.movieDetailPageState,
    @required this.selectCinemaState,
    @required this.selectPlacesPageState,
    @required this.selectedCinema,
    @required this.isAppBarVisible,
    @required this.showBackButton,
    @required this.backAction,
  });

  final String appBarTitle;
  final HomeState homeState;
  final SelectCinemaState selectCinemaState;
  final MovieDetailPageState movieDetailPageState;
  final SelectPlacesPageState selectPlacesPageState;
  final CinemaModel selectedCinema;
  final bool showChangeCinemaButton;
  final bool isAppBarVisible;
  final bool showBackButton;
  final VoidCallback backAction;

  static AppState initial() {
    return AppState(
      homeState: HomeState.intiialState(),
      selectCinemaState: SelectCinemaState.initialState(),
      movieDetailPageState: MovieDetailPageState.initialState(),
      selectPlacesPageState: SelectPlacesPageState.initialState(),
      selectedCinema: null,
      appBarTitle: "",
      showChangeCinemaButton: false,
      isAppBarVisible: true,
      showBackButton: false,
      backAction: null,
    );
  }

  AppState copyWith({
    HomeState homeState,
    SelectCinemaState selectCinemaState,
    MovieDetailPageState movieDetailPageState,
    SelectPlacesPageState selectPlacesPageState,
    CinemaModel selectedCinema,
    String appBarTitle,
    bool showChangeCinemaButton,
    bool isAppBarVisible,
    bool showBackButton,
    VoidCallback backAction,
  }) {
    return AppState(
      homeState: homeState ?? this.homeState,
      selectCinemaState: selectCinemaState ?? this.selectCinemaState,
      selectedCinema: selectedCinema ?? this.selectedCinema,
      movieDetailPageState: movieDetailPageState ?? this.movieDetailPageState,
      selectPlacesPageState:
          selectPlacesPageState ?? this.selectPlacesPageState,
      appBarTitle: appBarTitle ?? this.appBarTitle,
      showChangeCinemaButton:
          showChangeCinemaButton ?? this.showChangeCinemaButton,
      isAppBarVisible: isAppBarVisible ?? this.isAppBarVisible,
      showBackButton: showBackButton ?? this.showBackButton,
      backAction: backAction ?? this.backAction,
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
      movieDetailPageStateMiddleware,
      selectPlacesPageStatesMiddleware,
    ],
  );
}
