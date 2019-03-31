import 'package:helios_app/models/featured_movies/featured_movie.dart';

class MainPageState {
  MainPageState({
    this.featuredMovies,
    this.isFeaturedMoviesLoading,
  });

  final List<FeaturedMovieModel> featuredMovies;
  final bool isFeaturedMoviesLoading;

  static MainPageState initialState() {
    return MainPageState(
      featuredMovies: [],
      isFeaturedMoviesLoading: false,
    );
  }

  MainPageState copyWith({
    List<FeaturedMovieModel> featuredMovies,
    bool isFeaturedMoviesLoading,
  }) {
    return MainPageState(
      featuredMovies: featuredMovies ?? this.featuredMovies,
      isFeaturedMoviesLoading:
          isFeaturedMoviesLoading ?? this.isFeaturedMoviesLoading,
    );
  }
}
