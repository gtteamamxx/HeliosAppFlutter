import 'package:helios_app/models/cinema/cinema_model.dart';
import 'package:helios_app/models/featured_movies/featured_movie.dart';

abstract class CinemaService {
  Future<List<CinemaModel>> getListOfCinemas(String searchText);
  Future<List<FeaturedMovieModel>> getFeaturedMovies();
}
