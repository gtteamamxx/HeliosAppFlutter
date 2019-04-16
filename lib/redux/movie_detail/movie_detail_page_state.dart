import 'package:helios_app/models/movie/movie_model.dart';
import 'package:helios_app/models/repertoire/movie_repertoire.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';

class MovieDetailPageState {
  MovieDetailPageState({
    this.movie,
    this.isLoading,
    this.isError,
    this.movieRepertoire,
    this.isLoadingMovieRepertoire,
    this.isErrorMovieRepertoire,
  });

  final MovieModel movie;
  final bool isLoading;
  final bool isError;

  final MovieRepertoireModel movieRepertoire;
  final bool isLoadingMovieRepertoire;
  final bool isErrorMovieRepertoire;

  static MovieDetailPageState initialState() {
    return MovieDetailPageState(
      movie: null,
      isLoading: false,
      isError: false,
      movieRepertoire: null,
      isErrorMovieRepertoire: false,
      isLoadingMovieRepertoire: false,
    );
  }

  MovieDetailPageState copyWith({
    MovieModel movie,
    bool isLoading,
    bool isError,
    MovieRepertoireModel movieRepertoire,
    bool isLoadingMovieRepertoire,
    bool isErrorMovieRepertoire,
  }) {
    return MovieDetailPageState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      movie: movie ?? this.movie,
      movieRepertoire: movieRepertoire ?? this.movieRepertoire,
      isLoadingMovieRepertoire:
          isLoadingMovieRepertoire ?? this.isLoadingMovieRepertoire,
      isErrorMovieRepertoire:
          isErrorMovieRepertoire ?? this.isErrorMovieRepertoire,
    );
  }
}
