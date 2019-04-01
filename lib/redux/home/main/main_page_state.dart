import 'package:flutter/material.dart';
import 'package:helios_app/models/featured_movies/featured_movie.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';

class MainPageState {
  MainPageState({
    this.featuredMovies,
    this.isFeaturedMoviesLoading,
    this.selectedRepertoireTimeOfTheDay,
    this.repertoire,
    this.isRepertoireLoading,
  });

  final List<FeaturedMovieModel> featuredMovies;
  final bool isFeaturedMoviesLoading;

  final TimeOfTheDayEnum selectedRepertoireTimeOfTheDay;
  final List<RepertoireModel> repertoire;
  final bool isRepertoireLoading;

  static MainPageState initialState() {
    return MainPageState(
      featuredMovies: [],
      isFeaturedMoviesLoading: false,
      selectedRepertoireTimeOfTheDay: getRepertoireTimeOfTheDayByNow(),
      repertoire: [],
      isRepertoireLoading: false,
    );
  }

  MainPageState copyWith({
    List<FeaturedMovieModel> featuredMovies,
    bool isFeaturedMoviesLoading,
    TimeOfTheDayEnum selectedRepertoireTimeOfTheDay,
    List<RepertoireModel> repertoire,
    bool isRepertoireLoading,
  }) {
    return MainPageState(
      featuredMovies: featuredMovies ?? this.featuredMovies,
      isFeaturedMoviesLoading:
          isFeaturedMoviesLoading ?? this.isFeaturedMoviesLoading,
      selectedRepertoireTimeOfTheDay:
          selectedRepertoireTimeOfTheDay ?? this.selectedRepertoireTimeOfTheDay,
      repertoire: repertoire ?? this.repertoire,
      isRepertoireLoading: isRepertoireLoading ?? this.isRepertoireLoading,
    );
  }

  static TimeOfTheDayEnum getRepertoireTimeOfTheDayByNow() {
    var now = DateTime.now();

    if (now.hour < 12) {
      return TimeOfTheDayEnum.UntilNoon;
    } else if (now.hour < 18) {
      return TimeOfTheDayEnum.InTheAfterNoon;
    } else {
      return TimeOfTheDayEnum.UntilNoon;
    }
  }
}
