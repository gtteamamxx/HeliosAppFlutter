import 'package:helios_app_flutter_x/models/ui/home/main/time_of_the_day.dart';
import 'package:helios_app_flutter_x/other/service_locator.dart';
import 'package:helios_app_flutter_x/other/services/abstract/cinema_service.dart';
import 'package:helios_app_flutter_x/redux/actions/home/main/error_fetching_announcements_light_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/main/error_fetching_descripted_events_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/main/error_fetching_featured_movies_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/main/error_fetching_repertoire_for_time_of_the_day_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/main/fetch_announcements_light_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/main/fetch_descripted_events_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/main/fetch_featured_movies_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/main/fetch_repertoire_for_time_of_the_day_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/main/finish_fetch_announcements_light_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/main/finish_fetch_descripted_events_action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/main/finish_fetch_featured_movies.action.dart';
import 'package:helios_app_flutter_x/redux/actions/home/main/finish_fetch_repertoire_for_time_of_the_day_action.dart';
import 'package:helios_app_flutter_x/redux/app/app_state.dart';
import 'package:redux/redux.dart';

void mainPageStateMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is FetchFeaturedMoviesAction) {
    _fetchFeaturedMoviesAction(next);
  } else if (action is FetchRepertoireForTimeOfTheDayAction) {
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
      .catchError((_) => next(ErrorFetchingDescriptedEventsAction()));
}

void _fetchRepertoireAction(
  TimeOfTheDayEnum timeOfTheDay,
  Store<AppState> store,
  NextDispatcher next,
) {
  var cinemaService = serviceLocator.get<CinemaService>();

  cinemaService
      .getTodayRepertoireForCinema(store.state.selectedCinema.id, timeOfTheDay)
      .then((repertoire) => next(FinishFetchRepertoireForTimeOfTheDayAction(repertoire: repertoire)))
      .catchError((_) => next(ErrorFetchingRepertoireForTimeOfTheDayAction()));
}

void _fetchFeaturedMoviesAction(NextDispatcher next) {
  var cinemaService = serviceLocator.get<CinemaService>();

  cinemaService
      .getFeaturedMovies()
      .then((featuredMovies) => next(FinishFetchFeaturedMoviesAction(featuredMovies)))
      .catchError((_) => next(ErrorFetchingFeaturedMoviesAction()));
}

void _fetchAnnouncementsLight(NextDispatcher next) {
  var cinemaService = serviceLocator.get<CinemaService>();

  cinemaService
      .getAnnouncementsLight()
      .then((announcements) => next(FinishFetchAnnouncementsLightAction(announcements)))
      .catchError((_) => next(ErrorFetchingAnnouncementsLightAction()));
}
