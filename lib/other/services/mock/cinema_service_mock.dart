import 'package:helios_app/models/announcment/announcment_model.dart';
import 'package:helios_app/models/cinema/cinema_model.dart';
import 'package:helios_app/models/event/event_descripted_model.dart';
import 'package:helios_app/models/featured_movies/featured_movie_model.dart';
import 'package:helios_app/models/movie/movie_model.dart';
import 'package:helios_app/models/play_hour/play_hour_model.dart';
import 'package:helios_app/models/pricing/pricing_model.dart';
import 'package:helios_app/models/repertoire/movie_repertoire.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';

import 'package:helios_app/other/services/abstract/cinema_service.dart';

import 'package:helios_app/other/services/mock/announcements_list.dart';
import 'package:helios_app/other/services/mock/cinemas_list.dart';
import 'package:helios_app/other/services/mock/events_list.dart';
import 'package:helios_app/other/services/mock/featured_movies_list.dart';
import 'package:helios_app/other/services/mock/movies_list.dart';
import 'package:helios_app/other/services/mock/pricing_list.dart';
import 'package:helios_app/other/services/mock/repertoire_list.dart';

class CinemaServiceMock implements CinemaService {
  @override
  Future<List<AnnouncementModel>> getAnnouncementsLight() {
    return Future.delayed(Duration(seconds: 5), () {
      return announcementsMock;
    });
  }

  @override
  Future<List<EventDescriptedModel>> getDescriptedEvents({int eventsNum}) {
    return Future.delayed(Duration(seconds: 4), () {
      return eventsMock;
    });
  }

  @override
  Future<List<FeaturedMovieModel>> getFeaturedMovies() {
    return Future<List<FeaturedMovieModel>>.delayed(Duration(seconds: 1), () {
      return featuredMoviesMock;
    });
  }

  @override
  Future<MovieModel> getMovieById(int movieId) {
    return Future<MovieModel>.delayed(Duration(seconds: 1), () {
      return moviesMock.firstWhere((x) => x.id == movieId);
    });
  }

  @override
  Future<List<PricingModel>> getPricingForCinema(int cinemaId) {
    return Future.delayed(Duration(seconds: 1), () {
      return pricingMock;
    });
  }

  @override
  Future<List<RepertoireModel>> getRepertoireForCinema(int cinemaId) {
    return Future<List<RepertoireModel>>.delayed(
        Duration(seconds: 1, milliseconds: 900), () {
      return repertoireMockData;
    });
  }

  @override
  Future<MovieRepertoireModel> getMovieRepertoireForToday(
      {int movieId, int cinemaId}) {
    return Future<MovieRepertoireModel>.delayed(Duration(milliseconds: 900),
        () {
      return repertoireMockData[0]
          .movies
          .singleWhere((x) => x.movie.id == movieId);
    });
  }

  @override
  Future<RepertoireModel> getTodayRepertoireForCinema(
      int cinemaId, TimeOfTheDayEnum timeOfTheDay) {
    return Future<RepertoireModel>.delayed(Duration(milliseconds: 900), () {
      RepertoireModel repertoire = repertoireMockData[0];
      List<MovieRepertoireModel> movieRepertoire =
          _trimMovieRepertoireByTimeOfTheDay(repertoire.movies, timeOfTheDay);

      List<MovieRepertoireModel> movieRepertoireCopy = [];

      for (MovieRepertoireModel mr in movieRepertoire) {
        MovieRepertoireModel mrm = MovieRepertoireModel(
          id: mr.id,
          movie: mr.movie,
          playHours: mr.playHours
              .map(
                (x) => PlayHourModel(
                      id: x.id,
                      cinemaHallId: x.cinemaHallId,
                      date: x.date,
                      repertoireMovieId: x.repertoireMovieId,
                    ),
              )
              .toList(),
        );

        if (timeOfTheDay == TimeOfTheDayEnum.UntilNoon) {
          mrm.playHours.removeWhere((x) => !(x.date.hour < 12));
        } else if (timeOfTheDay == TimeOfTheDayEnum.InTheAfterNoon) {
          mrm.playHours
              .removeWhere((x) => !(x.date.hour >= 12 && x.date.hour < 18));
        } else {
          mrm.playHours.removeWhere((x) => !(x.date.hour >= 18));
        }

        if (mrm.playHours.isNotEmpty) {
          movieRepertoireCopy.add(mrm);
        }
      }

      return RepertoireModel(
        id: repertoire.id,
        cinemaId: repertoire.cinemaId,
        date: repertoire.date,
        movies: movieRepertoireCopy,
      );
    });
  }

  @override
  Future<List<CinemaModel>> getListOfCinemas(String searchText) {
    return Future<List<CinemaModel>>.delayed(Duration(seconds: 1), () {
      int index = 0;
      List<CinemaModel> cinemas = cinemasMock
          .map((cinema) => CinemaModel(id: index++, name: cinema))
          .toList();
      if (searchText.isEmpty) {
        return cinemas;
      } else {
        return cinemas
            .where((x) => x.name.toLowerCase().contains(searchText))
            .toList();
      }
    });
  }

  List<MovieRepertoireModel> _trimMovieRepertoireByTimeOfTheDay(
      List<MovieRepertoireModel> input, TimeOfTheDayEnum timeOfTheDay) {
    if (timeOfTheDay == TimeOfTheDayEnum.UntilNoon) {
      return input
          .where((x) => x.playHours.any((y) => y.date.hour < 12))
          .toList();
    } else if (timeOfTheDay == TimeOfTheDayEnum.InTheAfterNoon) {
      return input
          .where((x) =>
              x.playHours.any((y) => y.date.hour >= 12 && y.date.hour < 18))
          .toList();
    } else {
      return input
          .where((x) => x.playHours.any((y) => y.date.hour >= 18))
          .toList();
    }
  }
}
