import 'package:helios_app/models/event/event_descripted_model.dart';
import 'package:helios_app/models/featured_movies/featured_movie_model.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';

class MainPageState {
  MainPageState({
    this.featuredMovies,
    this.isFeaturedMoviesLoading,
    this.selectedRepertoireTimeOfTheDay,
    this.repertoire,
    this.isRepertoireLoading,
    this.events,
    this.isEventsLoading,
  });

  final List<FeaturedMovieModel> featuredMovies;
  final bool isFeaturedMoviesLoading;

  final TimeOfTheDayEnum selectedRepertoireTimeOfTheDay;
  final List<RepertoireModel> repertoire;
  final bool isRepertoireLoading;

  final List<EventDescriptedModel> events;
  final bool isEventsLoading;

  static MainPageState initialState() {
    return MainPageState(
      featuredMovies: [],
      isFeaturedMoviesLoading: false,
      selectedRepertoireTimeOfTheDay: getRepertoireTimeOfTheDayByNow(),
      repertoire: [],
      isRepertoireLoading: false,
      events: [],
      isEventsLoading: false,
    );
  }

  MainPageState copyWith({
    List<FeaturedMovieModel> featuredMovies,
    bool isFeaturedMoviesLoading,
    TimeOfTheDayEnum selectedRepertoireTimeOfTheDay,
    List<RepertoireModel> repertoire,
    bool isRepertoireLoading,
    List<EventDescriptedModel> events,
    bool isEventsLoading,
  }) {
    return MainPageState(
      featuredMovies: featuredMovies ?? this.featuredMovies,
      isFeaturedMoviesLoading:
          isFeaturedMoviesLoading ?? this.isFeaturedMoviesLoading,
      selectedRepertoireTimeOfTheDay:
          selectedRepertoireTimeOfTheDay ?? this.selectedRepertoireTimeOfTheDay,
      repertoire: repertoire ?? this.repertoire,
      isRepertoireLoading: isRepertoireLoading ?? this.isRepertoireLoading,
      events: events ?? this.events,
      isEventsLoading: isEventsLoading ?? this.isEventsLoading,
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
