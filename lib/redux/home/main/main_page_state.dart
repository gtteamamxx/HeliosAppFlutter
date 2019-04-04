import 'package:helios_app/models/announcment/announcment_model.dart';
import 'package:helios_app/models/event/event_descripted_model.dart';
import 'package:helios_app/models/featured_movies/featured_movie_model.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';

class MainPageState {
  MainPageState({
    this.featuredMovies,
    this.isFeaturedMoviesLoading,
    this.isFeaturedMoviesError,
    this.selectedRepertoireTimeOfTheDay,
    this.repertoire,
    this.isRepertoireLoading,
    this.isRepertoireError,
    this.events,
    this.isEventsLoading,
    this.announcements,
    this.isAnnouncementsLoading,
  });

  final List<FeaturedMovieModel> featuredMovies;
  final bool isFeaturedMoviesLoading;
  final bool isFeaturedMoviesError;

  final TimeOfTheDayEnum selectedRepertoireTimeOfTheDay;
  final List<RepertoireModel> repertoire;
  final bool isRepertoireLoading;
  final bool isRepertoireError;

  final List<EventDescriptedModel> events;
  final bool isEventsLoading;

  final List<AnnouncementModel> announcements;
  final bool isAnnouncementsLoading;

  static MainPageState initialState() {
    return MainPageState(
      featuredMovies: [],
      isFeaturedMoviesLoading: false,
      selectedRepertoireTimeOfTheDay: getRepertoireTimeOfTheDayByNow(),
      repertoire: [],
      isRepertoireLoading: false,
      isRepertoireError: false,
      events: [],
      isEventsLoading: false,
      announcements: [],
      isAnnouncementsLoading: false,
      isFeaturedMoviesError: false,
    );
  }

  MainPageState copyWith({
    List<FeaturedMovieModel> featuredMovies,
    bool isFeaturedMoviesLoading,
    bool isFeaturedMoviesError,
    TimeOfTheDayEnum selectedRepertoireTimeOfTheDay,
    List<RepertoireModel> repertoire,
    bool isRepertoireLoading,
    bool isRepertoireError,
    List<EventDescriptedModel> events,
    bool isEventsLoading,
    List<AnnouncementModel> announcements,
    bool isAnnouncementsLoading,
  }) {
    return MainPageState(
      featuredMovies: featuredMovies ?? this.featuredMovies,
      isFeaturedMoviesLoading:
          isFeaturedMoviesLoading ?? this.isFeaturedMoviesLoading,
      isFeaturedMoviesError:
          isFeaturedMoviesError ?? this.isFeaturedMoviesError,
      selectedRepertoireTimeOfTheDay:
          selectedRepertoireTimeOfTheDay ?? this.selectedRepertoireTimeOfTheDay,
      repertoire: repertoire ?? this.repertoire,
      isRepertoireLoading: isRepertoireLoading ?? this.isRepertoireLoading,
      isRepertoireError: isRepertoireError ?? this.isRepertoireError,
      events: events ?? this.events,
      isEventsLoading: isEventsLoading ?? this.isEventsLoading,
      announcements: announcements ?? this.announcements,
      isAnnouncementsLoading:
          isAnnouncementsLoading ?? this.isAnnouncementsLoading,
    );
  }

  static TimeOfTheDayEnum getRepertoireTimeOfTheDayByNow() {
    var now = DateTime.now();

    if (now.hour < 12) {
      return TimeOfTheDayEnum.UntilNoon;
    } else if (now.hour >= 12 && now.hour < 18) {
      return TimeOfTheDayEnum.InTheAfterNoon;
    } else {
      return TimeOfTheDayEnum.UntilNoon;
    }
  }
}
