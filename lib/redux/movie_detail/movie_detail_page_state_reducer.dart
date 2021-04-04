import 'package:helios_app_flutter_x/redux/actions/movie_detail/error_fetching_movie_repertoire_action.dart';
import 'package:helios_app_flutter_x/redux/actions/movie_detail/fetch_movie_repertoire_action.dart';
import 'package:helios_app_flutter_x/redux/actions/movie_detail/finish_fetch_movie_repertoire_action.dart';
import 'package:helios_app_flutter_x/redux/movie_detail/movie_detail_page_state.dart';

MovieDetailPageState movieDetailPageStateReducer(MovieDetailPageState state, action) {
  if (action is FetchMovieRepertoireAction) {
    return state.copyWith(
      isLoadingMovieRepertoire: true,
      isErrorMovieRepertoire: false,
      movieRepertoire: null,
    );
  } else if (action is FinishFetchMovieRepertoireAction) {
    return state.copyWith(
      isLoadingMovieRepertoire: false,
      isErrorMovieRepertoire: false,
      movieRepertoire: action.movieRepertoire,
    );
  } else if (action is ErrorFetchingMovieRepertoireAction) {
    return state.copyWith(
      isLoadingMovieRepertoire: false,
      isErrorMovieRepertoire: true,
      movieRepertoire: null,
    );
  }

  return state;
}
