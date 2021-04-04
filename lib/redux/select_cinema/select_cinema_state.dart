import 'package:helios_app_flutter_x/models/cinema/cinema_model.dart';

class SelectCinemaState {
  SelectCinemaState({
    this.cinemas,
    this.isLoading,
  });

  final List<CinemaModel> cinemas;
  final bool isLoading;

  static SelectCinemaState initialState() {
    return SelectCinemaState(
      cinemas: [],
      isLoading: false,
    );
  }

  SelectCinemaState copyWith({
    List<CinemaModel> cinemas,
    bool isLoading,
  }) {
    return SelectCinemaState(
      cinemas: cinemas ?? this.cinemas,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
