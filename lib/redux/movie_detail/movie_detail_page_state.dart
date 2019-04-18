import 'package:helios_app/models/repertoire/movie_repertoire.dart';

class MovieDetailPageState {
  MovieDetailPageState({
    this.movieRepertoire,
    this.isLoadingMovieRepertoire,
    this.isErrorMovieRepertoire,
  });

  final MovieRepertoireModel movieRepertoire;
  final bool isLoadingMovieRepertoire;
  final bool isErrorMovieRepertoire;

  static MovieDetailPageState initialState() {
    return MovieDetailPageState(
      movieRepertoire: null,
      isErrorMovieRepertoire: false,
      isLoadingMovieRepertoire: false,
    );
  }

  MovieDetailPageState copyWith({
    MovieRepertoireModel movieRepertoire,
    bool isLoadingMovieRepertoire,
    bool isErrorMovieRepertoire,
  }) {
    return MovieDetailPageState(
      movieRepertoire: movieRepertoire ?? this.movieRepertoire,
      isLoadingMovieRepertoire:
          isLoadingMovieRepertoire ?? this.isLoadingMovieRepertoire,
      isErrorMovieRepertoire:
          isErrorMovieRepertoire ?? this.isErrorMovieRepertoire,
    );
  }
}
