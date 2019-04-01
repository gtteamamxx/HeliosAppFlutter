import 'package:flutter/material.dart';
import 'package:helios_app/models/featured_movies/featured_movie.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';
import 'package:helios_app/redux/actions/home/main/change_repertoire_time_of_the_day_action.dart';
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
  });

  final List<FeaturedMovieModel> featuredMovies;
  final bool isFeaturedMoviesLoading;

  final TimeOfTheDayEnum selectedRepertoireTimeOfTheDay;
  final List<RepertoireModel> repertoire;
  final bool isRepertoireLoading;
  final TimeOfTheDayChange onRepertoireTimeOfTheDayChange;

  static MainPageViewModel fromStore(Store<AppState> store) {
    MainPageState state = store.state.homeState.mainPageState;
    return MainPageViewModel(
      featuredMovies: state.featuredMovies,
      isFeaturedMoviesLoading: state.isFeaturedMoviesLoading,
      selectedRepertoireTimeOfTheDay: state.selectedRepertoireTimeOfTheDay,
      repertoire: state.repertoire,
      isRepertoireLoading: state.isRepertoireLoading,
      onRepertoireTimeOfTheDayChange: (timeOfTheDay) =>
          repertoireTimeOfTheDayChange(timeOfTheDay, store),
    );
  }

  static repertoireTimeOfTheDayChange(
      TimeOfTheDayEnum timeOfTheDay, Store<AppState> store) {
    store.dispatch(ChangeRepertoireTimeOfTheDayAction(timeOfTheDay));
  }
}
