import 'package:helios_app/models/announcment/announcment_model.dart';
import 'package:helios_app/models/event/event_descripted_model.dart';
import 'package:helios_app/models/featured_movies/featured_movie_model.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';
import 'package:helios_app/redux/actions/home/main/change_repertoire_time_of_the_day_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_repertoire_for_time_of_the_day_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/redux/home/main/main_page_state.dart';
import 'package:helios_app/ui/home/main/repertoire_list.dart';
import 'package:redux/redux.dart';

class MainPageViewModel {
  MainPageViewModel({
    this.featuredMovies,
    this.isFeaturedMoviesLoading,
    this.selectedRepertoireTimeOfTheDay,
    this.repertoire,
    this.isRepertoireLoading,
    this.onRepertoireTimeOfTheDayChange,
    this.events,
    this.isEventsLoading,
    this.announcements,
    this.isAnnouncementsLoading,
  });

  final List<FeaturedMovieModel> featuredMovies;
  final bool isFeaturedMoviesLoading;

  final TimeOfTheDayEnum selectedRepertoireTimeOfTheDay;
  final List<RepertoireModel> repertoire;
  final bool isRepertoireLoading;
  final TimeOfTheDayChange onRepertoireTimeOfTheDayChange;

  final List<EventDescriptedModel> events;
  final bool isEventsLoading;

  final List<AnnouncementModel> announcements;
  final bool isAnnouncementsLoading;

  static MainPageViewModel fromStore(Store<AppState> store) {
    MainPageState state = store.state.homeState.mainPageState;
    return MainPageViewModel(
      featuredMovies: state.featuredMovies,
      isFeaturedMoviesLoading: state.isFeaturedMoviesLoading,
      selectedRepertoireTimeOfTheDay: state.selectedRepertoireTimeOfTheDay,
      repertoire: state.repertoire,
      isRepertoireLoading: state.isRepertoireLoading,
      onRepertoireTimeOfTheDayChange: (timeOfTheDay) =>
          repertoireTimeOfTheDayChange(timeOfTheDay, store, state),
      events: state.events,
      isEventsLoading: state.isEventsLoading,
      announcements: state.announcements,
      isAnnouncementsLoading: state.isAnnouncementsLoading,
    );
  }

  static repertoireTimeOfTheDayChange(
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
}
