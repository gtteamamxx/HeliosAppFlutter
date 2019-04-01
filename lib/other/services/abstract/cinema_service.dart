import 'package:helios_app/models/cinema/cinema_model.dart';
import 'package:helios_app/models/featured_movies/featured_movie.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';

abstract class CinemaService {
  Future<List<CinemaModel>> getListOfCinemas(String searchText);
  Future<List<FeaturedMovieModel>> getFeaturedMovies();
  Future<List<RepertoireModel>> getTodayRepertoire(int cinemaId);
}
