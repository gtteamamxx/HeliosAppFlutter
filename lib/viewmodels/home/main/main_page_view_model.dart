import 'package:flutter/material.dart';
import 'package:helios_app/models/announcment/announcment_model.dart';
import 'package:helios_app/models/event/event_descripted_model.dart';
import 'package:helios_app/models/featured_movies/featured_movie_model.dart';
import 'package:helios_app/models/repertoire/movie_repertoire.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';
import 'package:helios_app/redux/actions/home/main/change_repertoire_time_of_the_day_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_announcements_light_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_descripted_events_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_featured_movies_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_repertoire_for_time_of_the_day_action.dart';
import 'package:helios_app/redux/actions/show_movie_detail_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/redux/home/main/main_page_state.dart';
import 'package:helios_app/ui/common/image_carousel.dart';
import 'package:helios_app/ui/home/main/movie_repertoire_list.dart';
import 'package:redux/redux.dart';

class MainPageViewModel {
  MainPageViewModel({
    this.featuredMovies,
    this.isFeaturedMoviesLoading,
    this.isFeaturedMoviesError,
    this.onRefreshFeaturedMovies,
    this.selectedRepertoireTimeOfTheDay,
    this.todayRepertoire,
    this.isRepertoireLoading,
    this.isRepertoireError,
    this.onRefreshRepertoire,
    this.onRepertoireTimeOfTheDayChange,
    this.events,
    this.isEventsLoading,
    this.isEventsError,
    this.onRefreshEvents,
    this.announcements,
    this.isAnnouncementsLoading,
    this.isAnnouncementsError,
    this.onRefreshAnnouncements,
    this.onFeaturedMovieTap,
    this.onMovieRepertoireTap,
  });

  final List<FeaturedMovieModel> featuredMovies;
  final bool isFeaturedMoviesLoading;
  final bool isFeaturedMoviesError;
  final VoidCallback onRefreshFeaturedMovies;

  final TimeOfTheDayEnum selectedRepertoireTimeOfTheDay;
  final RepertoireModel todayRepertoire;
  final bool isRepertoireLoading;
  final bool isRepertoireError;
  final TimeOfTheDayChange onRepertoireTimeOfTheDayChange;
  final VoidCallback onRefreshRepertoire;

  final List<EventDescriptedModel> events;
  final bool isEventsLoading;
  final bool isEventsError;
  final VoidCallback onRefreshEvents;

  final List<AnnouncementModel> announcements;
  final bool isAnnouncementsLoading;
  final bool isAnnouncementsError;
  final VoidCallback onRefreshAnnouncements;

  final FeaturedMovieTap onFeaturedMovieTap;
  final MovieRepertoireTap onMovieRepertoireTap;

  static MainPageViewModel fromStore(Store<AppState> store) {
    MainPageState state = store.state.homeState.mainPageState;
    return MainPageViewModel(
      featuredMovies: state.featuredMovies,
      isFeaturedMoviesLoading: state.isFeaturedMoviesLoading,
      isFeaturedMoviesError: state.isFeaturedMoviesError,
      onRefreshFeaturedMovies: () => _refreshFeaturedMovies(store),
      selectedRepertoireTimeOfTheDay: state.selectedRepertoireTimeOfTheDay,
      todayRepertoire: state.todayRepertoire,
      isRepertoireLoading: state.isRepertoireLoading,
      isRepertoireError: state.isRepertoireError,
      onRefreshRepertoire: () =>
          _refreshRepertoire(store, state.selectedRepertoireTimeOfTheDay),
      onRepertoireTimeOfTheDayChange: (timeOfTheDay) =>
          _repertoireTimeOfTheDayChange(timeOfTheDay, store, state),
      events: state.events,
      isEventsLoading: state.isEventsLoading,
      isEventsError: state.isEventsError,
      onRefreshEvents: () => _refreshEvents(store),
      announcements: state.announcements,
      isAnnouncementsLoading: state.isAnnouncementsLoading,
      isAnnouncementsError: state.isAnnouncementsError,
      onRefreshAnnouncements: () => _refreshAnnouncements(store),
      onFeaturedMovieTap: (featuredMovie) =>
          _onFeaturedMovieTap(store, featuredMovie),
      onMovieRepertoireTap: (movieRepertoire) =>
          _onRepertoireTap(store, movieRepertoire),
    );
  }

  static _repertoireTimeOfTheDayChange(
    TimeOfTheDayEnum timeOfTheDay,
    Store<AppState> store,
    MainPageState state,
  ) {
    if (state.selectedRepertoireTimeOfTheDay == timeOfTheDay) {
      return;
    }

    store.dispatch(ChangeRepertoireTimeOfTheDayAction(timeOfTheDay));
    store.dispatch(FetchRepertoireForTimeOfTheDayAction(timeOfTheDay));
  }

  static _refreshFeaturedMovies(Store<AppState> store) {
    store.dispatch(FetchFeaturedMoviesAction());
  }

  static _refreshRepertoire(
      Store<AppState> store, TimeOfTheDayEnum selectedRepertoireTimeOfTheDay) {
    store.dispatch(
        FetchRepertoireForTimeOfTheDayAction(selectedRepertoireTimeOfTheDay));
  }

  static _refreshEvents(Store<AppState> store) {
    store.dispatch(FetchDescriptedEventsAction());
  }

  static _refreshAnnouncements(Store<AppState> store) {
    store.dispatch(FetchAnnouncementsLightAction());
  }

  static _onFeaturedMovieTap(
      Store<AppState> store, FeaturedMovieModel featuredMovie) {
    store.dispatch(ShowMovieDetailByIdAction(repertoireId: featuredMovie.id));
  }

  static _onRepertoireTap(
      Store<AppState> store, MovieRepertoireModel movieRepertoire) {
    store.dispatch(ShowMovieDetailAction(movieRepertoire: movieRepertoire));
  }
}
