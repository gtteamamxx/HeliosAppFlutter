import 'package:helios_app_flutter_x/models/announcment/announcment_model.dart';
import 'package:helios_app_flutter_x/models/cinema/cinema_model.dart';
import 'package:helios_app_flutter_x/models/event/event_descripted_model.dart';
import 'package:helios_app_flutter_x/models/featured_movies/featured_movie_model.dart';
import 'package:helios_app_flutter_x/models/movie/movie_model.dart';
import 'package:helios_app_flutter_x/models/pricing/pricing_model.dart';
import 'package:helios_app_flutter_x/models/repertoire/movie_repertoire.dart';
import 'package:helios_app_flutter_x/models/repertoire/repertoire_model.dart';
import 'package:helios_app_flutter_x/models/ui/home/main/time_of_the_day.dart';

abstract class CinemaService {
  Future<List<CinemaModel>> getListOfCinemas(String searchText);

  Future<List<FeaturedMovieModel>> getFeaturedMovies();

  Future<RepertoireModel> getTodayRepertoireForCinema(
    int cinemaId,
    TimeOfTheDayEnum timeOfTheDay,
  );

  Future<List<RepertoireModel>> getRepertoireForCinema(int cinemaId);

  Future<List<EventDescriptedModel>> getDescriptedEvents({int eventsNum});

  Future<List<AnnouncementModel>> getAnnouncementsLight();

  Future<List<PricingModel>> getPricingForCinema(int cinemaId);

  Future<MovieModel> getMovieById(int movieId);

  Future<MovieRepertoireModel> getMovieRepertoireForToday({int movieId, int cinemaId});
}
