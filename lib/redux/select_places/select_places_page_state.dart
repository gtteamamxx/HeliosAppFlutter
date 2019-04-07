import 'package:helios_app/models/place/place_model.dart';
import 'package:helios_app/models/repertoire/movie_repertoire.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';

class SelectPlacesPageState {
  SelectPlacesPageState({
    this.movieRepertoire,
    this.repertoire,
    this.places,
    this.isLoading,
    this.isError,
  });

  final List<PlaceModel> places;
  final bool isLoading;
  final bool isError;
  final MovieRepertoireModel movieRepertoire;
  final RepertoireModel repertoire;

  static SelectPlacesPageState initialState() {
    return SelectPlacesPageState(
      places: [],
      isLoading: false,
      isError: false,
      movieRepertoire: null,
      repertoire: null,
    );
  }

  SelectPlacesPageState copyWith({
    List<PlaceModel> places,
    bool isLoading,
    bool isError,
    MovieRepertoireModel movieRepertoire,
    RepertoireModel repertoire,
  }) {
    return SelectPlacesPageState(
      places: places ?? this.places,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      movieRepertoire: movieRepertoire ?? this.movieRepertoire,
      repertoire: repertoire ?? this.repertoire,
    );
  }
}
