import 'package:helios_app/redux/actions/home/main/change_repertoire_time_of_the_day_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_announcements_light_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_descripted_events_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_featured_movies_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_repertoire_time_of_the_day_action.dart';
import 'package:helios_app/redux/actions/home/main/finish_fetch_announcements_light_action.dart';
import 'package:helios_app/redux/actions/home/main/finish_fetch_descripted_events_action.dart';
import 'package:helios_app/redux/actions/home/main/finish_fetch_featured_movies.action.dart';
import 'package:helios_app/redux/actions/home/main/finish_fetch_repertoire_action.dart';
import 'package:helios_app/redux/home/main/main_page_state.dart';

MainPageState mainPageStateReducer(MainPageState state, dynamic action) {
  if (action is FetchFeaturedMoviesAction) {
    return state.copyWith(isFeaturedMoviesLoading: true);
  } else if (action is FinishFetchFeaturedMoviesAction) {
    return state.copyWith(
        featuredMovies: action.featuredMovies, isFeaturedMoviesLoading: false);
  } else if (action is FetchRepertoireAction) {
    return state.copyWith(isRepertoireLoading: true);
  } else if (action is FinishFetchRepertoireAction) {
    return state.copyWith(
      repertoire: action.repertoire,
      isRepertoireLoading: false,
    );
  } else if (action is ChangeRepertoireTimeOfTheDayAction) {
    return state.copyWith(selectedRepertoireTimeOfTheDay: action.timeOfTheDay);
  } else if (action is FetchDescriptedEventsAction) {
    return state.copyWith(isEventsLoading: true);
  } else if (action is FinishFetchDescriptedEventsAction) {
    return state.copyWith(isEventsLoading: false, events: action.events);
  } else if (action is FetchAnnouncementsLightAction) {
    return state.copyWith(isAnnouncementsLoading: true);
  } else if (action is FinishFetchAnnouncementsLightAction) {
    return state.copyWith(
        isAnnouncementsLoading: false, announcements: action.announcments);
  }

  return state;
}
