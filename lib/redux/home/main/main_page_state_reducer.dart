import 'package:helios_app_flutter_x/redux/actions/home/main/change_repertoire_time_of_the_day_action.dart';
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
import 'package:helios_app_flutter_x/redux/home/main/main_page_state.dart';

MainPageState mainPageStateReducer(MainPageState state, dynamic action) {
  if (action is FetchFeaturedMoviesAction) {
    return state.copyWith(
      isFeaturedMoviesLoading: true,
      isFeaturedMoviesError: false,
      featuredMovies: [],
    );
  } else if (action is FinishFetchFeaturedMoviesAction) {
    return state.copyWith(
      featuredMovies: action.featuredMovies,
      isFeaturedMoviesLoading: false,
      isFeaturedMoviesError: false,
    );
  } else if (action is ErrorFetchingFeaturedMoviesAction) {
    return state.copyWith(
      isFeaturedMoviesError: true,
      isFeaturedMoviesLoading: false,
      featuredMovies: [],
    );
  } else if (action is FetchRepertoireForTimeOfTheDayAction) {
    return state.copyWith(
      isRepertoireLoading: true,
      isRepertoireError: false,
      todayRepertoire: null,
    );
  } else if (action is FinishFetchRepertoireForTimeOfTheDayAction) {
    return state.copyWith(
      todayRepertoire: action.repertoire,
      isRepertoireLoading: false,
      isRepertoireError: false,
    );
  } else if (action is ErrorFetchingRepertoireForTimeOfTheDayAction) {
    return state.copyWith(
      todayRepertoire: null,
      isRepertoireLoading: false,
      isRepertoireError: true,
    );
  } else if (action is ChangeRepertoireTimeOfTheDayAction) {
    return state.copyWith(selectedRepertoireTimeOfTheDay: action.timeOfTheDay);
  } else if (action is FetchDescriptedEventsAction) {
    return state.copyWith(
      isEventsLoading: true,
      isEventsError: false,
      events: [],
    );
  } else if (action is FinishFetchDescriptedEventsAction) {
    return state.copyWith(
      isEventsLoading: false,
      isEventsError: false,
      events: action.events,
    );
  } else if (action is ErrorFetchingDescriptedEventsAction) {
    return state.copyWith(
      isEventsLoading: false,
      isEventsError: true,
      events: [],
    );
  } else if (action is FetchAnnouncementsLightAction) {
    return state.copyWith(
      isAnnouncementsLoading: true,
      isAnnouncementsError: false,
      announcements: [],
    );
  } else if (action is FinishFetchAnnouncementsLightAction) {
    return state.copyWith(
      isAnnouncementsLoading: false,
      isAnnouncementsError: false,
      announcements: action.announcments,
    );
  } else if (action is ErrorFetchingAnnouncementsLightAction) {
    return state.copyWith(
      isAnnouncementsLoading: false,
      isAnnouncementsError: true,
      announcements: [],
    );
  }

  return state;
}
