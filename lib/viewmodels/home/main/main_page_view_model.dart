import 'package:helios_app/models/featured_movies/featured_movie.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/redux/home/main/main_page_state.dart';
import 'package:redux/redux.dart';

class MainPageViewModel {
  MainPageViewModel({
    this.featuredMovies,
    this.isFeaturedMoviesLoading,
  });

  final List<FeaturedMovieModel> featuredMovies;
  final bool isFeaturedMoviesLoading;

  static MainPageViewModel fromStore(Store<AppState> store) {
    MainPageState state = store.state.homeState.mainPageState;
    return MainPageViewModel(
      featuredMovies: state.featuredMovies,
      isFeaturedMoviesLoading: state.isFeaturedMoviesLoading,
    );
  }
}
