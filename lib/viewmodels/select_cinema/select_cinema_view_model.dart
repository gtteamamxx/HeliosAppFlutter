import 'package:helios_app/redux/actions/select_cinema/FetchCinemasAction.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

typedef OnCinemaNameChanged = Function(String cinemaName);

class SelectCinemaViewModel {
  SelectCinemaViewModel({
    this.cinemas,
    this.isLoading,
    this.onCinemaNameChanged,
  });

  final List<String> cinemas;
  final bool isLoading;
  final OnCinemaNameChanged onCinemaNameChanged;

  static SelectCinemaViewModel fromStore(Store<AppState> store) {
    return SelectCinemaViewModel(
      cinemas: store.state.selectCinemaState.cinemas,
      isLoading: store.state.selectCinemaState.isLoading,
      onCinemaNameChanged: (cinemaName) =>
          searchByCinemaName(cinemaName, store),
    );
  }

  static void searchByCinemaName(
      String typedCinemaName, Store<AppState> store) {
    store.dispatch(
      FetchCinemasAction(searchText: typedCinemaName),
    );
  }
}
