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
    this.todayRepertoire,
    this.isRepertoireLoading,
    this.isRepertoireError,
    this.events,
    this.isEventsLoading,
    this.isEventsError,
    this.announcements,
    this.isAnnouncementsLoading,
    this.isAnnouncementsError,
  });

  final List<FeaturedMovieModel> featuredMovies;
  final bool isFeaturedMoviesLoading;
  final bool isFeaturedMoviesError;

  final TimeOfTheDayEnum selectedRepertoireTimeOfTheDay;
  final RepertoireModel todayRepertoire;
  final bool isRepertoireLoading;
  final bool isRepertoireError;

  final List<EventDescriptedModel> events;
  final bool isEventsLoading;
  final bool isEventsError;

  final List<AnnouncementModel> announcements;
  final bool isAnnouncementsLoading;
  final bool isAnnouncementsError;

  static MainPageState initialState() {
    return MainPageState(
      featuredMovies: [],
      isFeaturedMoviesLoading: false,
      isFeaturedMoviesError: false,
      selectedRepertoireTimeOfTheDay: getRepertoireTimeOfTheDayByNow(),
      todayRepertoire: null,
      isRepertoireLoading: false,
      isRepertoireError: false,
      events: [],
      isEventsLoading: false,
      isEventsError: false,
      announcements: [],
      isAnnouncementsLoading: false,
      isAnnouncementsError: false,
    );
  }

  MainPageState copyWith({
    List<FeaturedMovieModel> featuredMovies,
    bool isFeaturedMoviesLoading,
    bool isFeaturedMoviesError,
    TimeOfTheDayEnum selectedRepertoireTimeOfTheDay,
    RepertoireModel todayRepertoire,
    bool isRepertoireLoading,
    bool isRepertoireError,
    List<EventDescriptedModel> events,
    bool isEventsLoading,
    bool isEventsError,
    List<AnnouncementModel> announcements,
    bool isAnnouncementsLoading,
    bool isAnnouncementsError,
  }) {
    return MainPageState(
      featuredMovies: featuredMovies ?? this.featuredMovies,
      isFeaturedMoviesLoading:
          isFeaturedMoviesLoading ?? this.isFeaturedMoviesLoading,
      isFeaturedMoviesError:
          isFeaturedMoviesError ?? this.isFeaturedMoviesError,
      selectedRepertoireTimeOfTheDay:
          selectedRepertoireTimeOfTheDay ?? this.selectedRepertoireTimeOfTheDay,
      todayRepertoire: todayRepertoire ?? this.todayRepertoire,
      isRepertoireLoading: isRepertoireLoading ?? this.isRepertoireLoading,
      isRepertoireError: isRepertoireError ?? this.isRepertoireError,
      events: events ?? this.events,
      isEventsLoading: isEventsLoading ?? this.isEventsLoading,
      isEventsError: isEventsError ?? this.isEventsError,
      announcements: announcements ?? this.announcements,
      isAnnouncementsLoading:
          isAnnouncementsLoading ?? this.isAnnouncementsLoading,
      isAnnouncementsError: isAnnouncementsError ?? this.isAnnouncementsError,
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
