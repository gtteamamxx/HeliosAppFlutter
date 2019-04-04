import 'package:helios_app/models/repertoire/repertoire_model.dart';

class MovieDetailPageState {
  MovieDetailPageState({
    this.repertoire,
    this.isLoading,
    this.isError,
  });

  final RepertoireModel repertoire;
  final bool isLoading;
  final bool isError;

  static MovieDetailPageState initialState() {
    return MovieDetailPageState(
      repertoire: null,
      isLoading: false,
      isError: false,
    );
  }

  MovieDetailPageState copyWith({
    RepertoireModel repertoire,
    bool isLoading,
    bool isError,
  }) {
    return MovieDetailPageState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      repertoire: repertoire ?? this.repertoire,
    );
  }
}
