import 'package:helios_app/redux/home/home_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:helios_app/redux/app/app_reducer.dart';
import 'package:helios_app/redux/app/app_middleware.dart';

class AppState {
  AppState({
    @required this.homeState,
  });

  final HomeState homeState;

  static AppState initial() {
    return AppState(
      homeState: HomeState.intiialState(),
    );
  }

  AppState copyWith({
    HomeState homeState,
  }) {
    return AppState(
      homeState: homeState ?? this.homeState,
    );
  }
}

Store<AppState> configureStore() {
  return Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [appMiddleware],
  );
}
