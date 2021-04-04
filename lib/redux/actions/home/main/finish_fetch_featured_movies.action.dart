import 'package:helios_app_flutter_x/models/featured_movies/featured_movie_model.dart';

class FinishFetchFeaturedMoviesAction {
  FinishFetchFeaturedMoviesAction(this.featuredMovies);

  final List<FeaturedMovieModel> featuredMovies;
}
