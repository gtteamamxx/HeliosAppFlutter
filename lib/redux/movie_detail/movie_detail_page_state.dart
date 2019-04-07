import 'package:helios_app/models/repertoire/movie_repertoire.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';

class MovieDetailPageState {
  MovieDetailPageState({
    this.repertoire,
    this.isLoading,
    this.isError,
    this.movieRepertoire,
    this.isLoadingMovieRepertoire,
    this.isErrorMovieRepertoire,
  });

  final RepertoireModel repertoire;
  final bool isLoading;
  final bool isError;

  final List<MovieRepertoireModel> movieRepertoire;
  final bool isLoadingMovieRepertoire;
  final bool isErrorMovieRepertoire;

  static MovieDetailPageState initialState() {
    return MovieDetailPageState(
      repertoire: null,
      isLoading: false,
      isError: false,
      movieRepertoire: [],
      isErrorMovieRepertoire: false,
      isLoadingMovieRepertoire: false,
    );
  }

  MovieDetailPageState copyWith({
    RepertoireModel repertoire,
    bool isLoading,
    bool isError,
    List<MovieRepertoireModel> movieRepertoire,
    bool isLoadingMovieRepertoire,
    bool isErrorMovieRepertoire,
  }) {
    return MovieDetailPageState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      repertoire: repertoire ?? this.repertoire,
      movieRepertoire: movieRepertoire ?? this.movieRepertoire,
      isLoadingMovieRepertoire:
          isLoadingMovieRepertoire ?? this.isLoadingMovieRepertoire,
      isErrorMovieRepertoire:
          isErrorMovieRepertoire ?? this.isErrorMovieRepertoire,
    );
  }
}
