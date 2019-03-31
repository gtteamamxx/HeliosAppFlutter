import 'package:helios_app/redux/actions/home/main/fetch_featured_movies_action.dart';
import 'package:helios_app/redux/actions/home/main/finish_fetch_featured_movies.action.dart';
import 'package:helios_app/redux/home/main/main_page_state.dart';

MainPageState mainPageStateReducer(MainPageState state, dynamic action) {
  if (action is FetchFeaturedMoviesAction) {
    return state.copyWith(isFeaturedMoviesLoading: true);
  } else if (action is FinishFetchFeaturedMoviesAction) {
    return state.copyWith(
        featuredMovies: action.featuredMovies, isFeaturedMoviesLoading: false);
  }

  return state;
}
