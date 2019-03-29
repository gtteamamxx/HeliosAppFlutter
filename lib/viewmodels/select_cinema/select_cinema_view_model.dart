import 'package:helios_app/models/cinema/cinema_model.dart';
import 'package:helios_app/redux/actions/navigate_action.dart';
import 'package:helios_app/redux/actions/select_cinema/fetch_cinemas_action.dart';
import 'package:helios_app/redux/actions/select_cinema/select_cinema_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

typedef OnCinemaNameChanged = Function(String cinemaName);
typedef OnCinemaSelected = Function(CinemaModel cinema);

class SelectCinemaViewModel {
  SelectCinemaViewModel(
      {this.cinemas,
      this.isLoading,
      this.onCinemaNameChanged,
      this.onCinemaSelected,
      this.selectedCinema});

  final List<CinemaModel> cinemas;
  final bool isLoading;
  final OnCinemaNameChanged onCinemaNameChanged;
  final OnCinemaSelected onCinemaSelected;
  final CinemaModel selectedCinema;

  static SelectCinemaViewModel fromStore(Store<AppState> store) {
    return SelectCinemaViewModel(
        cinemas: store.state.selectCinemaState.cinemas,
        isLoading: store.state.selectCinemaState.isLoading,
        onCinemaNameChanged: (cinemaName) =>
            _searchByCinemaName(cinemaName, store),
        onCinemaSelected: (cinema) => _selectCinema(cinema, store),
        selectedCinema: store.state.selectedCinema);
  }

  static void _selectCinema(CinemaModel cinema, Store<AppState> store) {
    store.dispatch(SelectCinemaAction(cinema));
    store.dispatch(NavigateAction(route: '/home'));
  }

  static void _searchByCinemaName(
      String typedCinemaName, Store<AppState> store) {
    store.dispatch(FetchCinemasAction(searchText: typedCinemaName));
  }

  bool isCinemaSelected(CinemaModel cinema) {
    if (this.selectedCinema == null) {
      return false;
    }

    return cinema.name == this.selectedCinema.name;
  }
}
