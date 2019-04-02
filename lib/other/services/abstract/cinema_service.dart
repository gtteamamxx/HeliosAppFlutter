import 'package:helios_app/models/announcment/announcment_model.dart';
import 'package:helios_app/models/cinema/cinema_model.dart';
import 'package:helios_app/models/event/event_descripted_model.dart';
import 'package:helios_app/models/featured_movies/featured_movie_model.dart';
import 'package:helios_app/models/pricing/pricing_model.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';

abstract class CinemaService {
  Future<List<CinemaModel>> getListOfCinemas(String searchText);
  Future<List<FeaturedMovieModel>> getFeaturedMovies();
  Future<List<RepertoireModel>> getTodayRepertoire(
      int cinemaId, TimeOfTheDayEnum timeOfTheDay);
  Future<List<EventDescriptedModel>> getDescriptedEvents({int eventsNum});
  Future<List<AnnouncementModel>> getAnnouncementsLight();
  Future<List<PricingModel>> getPricingForCinema(int cinemaId);
}
