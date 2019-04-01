import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';
import 'package:helios_app/other/service_locator.dart';
import 'package:helios_app/other/services/abstract/cinema_service.dart';
import 'package:helios_app/redux/actions/home/main/fetch_announcements_light_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_descripted_events_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_featured_movies_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_repertoire_time_of_the_day_action.dart';
import 'package:helios_app/redux/actions/home/main/finish_fetch_announcements_light_action.dart';
import 'package:helios_app/redux/actions/home/main/finish_fetch_descripted_events_action.dart';
import 'package:helios_app/redux/actions/home/main/finish_fetch_featured_movies.action.dart';
import 'package:helios_app/redux/actions/home/main/finish_fetch_repertoire_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void mainPageStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) {
  if (action is FetchFeaturedMoviesAction) {
    _fetchFeaturedMoviesAction(next);
  } else if (action is FetchRepertoireAction) {
    _fetchRepertoireAction(action.timeOfTheDay, store, next);
  } else if (action is FetchDescriptedEventsAction) {
    _fetchDescriptedEventsAction(next);
  } else if (action is FetchAnnouncementsLightAction) {
    _fetchAnnouncementsLight(next);
  }

  next(action);
}

void _fetchDescriptedEventsAction(NextDispatcher next) {
  var cinemaService = serviceLocator.get<CinemaService>();

  cinemaService
      .getDescriptedEvents()
      .then((events) => next(FinishFetchDescriptedEventsAction(events)))
      .catchError((_) => next(FinishFetchDescriptedEventsAction([])));
}

void _fetchRepertoireAction(
  TimeOfTheDayEnum timeOfTheDay,
  Store<AppState> store,
  NextDispatcher next,
) {
  var cinemaService = serviceLocator.get<CinemaService>();

  cinemaService
      .getTodayRepertoire(store.state.selectedCinema.id, timeOfTheDay)
      .then(
        (repertoire) =>
            next(FinishFetchRepertoireAction(repertoire: repertoire)),
      )
      .catchError(
        (_) => next(FinishFetchRepertoireAction(repertoire: [])),
      );
}

void _fetchFeaturedMoviesAction(NextDispatcher next) {
  var cinemaService = serviceLocator.get<CinemaService>();

  cinemaService
      .getFeaturedMovies()
      .then((featuredMovies) =>
          next(FinishFetchFeaturedMoviesAction(featuredMovies)))
      .catchError((_) => next(FinishFetchFeaturedMoviesAction([])));
}

void _fetchAnnouncementsLight(NextDispatcher next) {
  var cinemaService = serviceLocator.get<CinemaService>();

  cinemaService
      .getAnnouncementsLight()
      .then((announcements) =>
          next(FinishFetchAnnouncementsLightAction(announcements)))
      .catchError((_) => next(FinishFetchAnnouncementsLightAction([])));
}
