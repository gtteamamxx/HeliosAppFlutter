import 'package:helios_app/redux/actions/movie_detail/error_fetching_movie_repertoire_action.dart';
import 'package:helios_app/redux/actions/movie_detail/fetch_movie_repertoire_action.dart';
import 'package:helios_app/redux/actions/movie_detail/finish_fetch_repertoire_action.dart';
import 'package:helios_app/redux/movie_detail/movie_detail_page_state.dart';
import 'package:helios_app/redux/actions/movie_detail/error_fetching_concrete_repertoire_action.dart';
import 'package:helios_app/redux/actions/movie_detail/fetch_concrete_repertoire_action.dart';
import 'package:helios_app/redux/actions/movie_detail/finish_fetch_concrete_repertoire_action.dart';

MovieDetailPageState movieDetailPageStateReducer(
    MovieDetailPageState state, action) {
  if (action is FetchConcreteRepertoireAction) {
    return state.copyWith(
      isError: false,
      isLoading: true,
      movie: null,
    );
  } else if (action is FinishFetchConcreteMovieRepertoireAction) {
    return state.copyWith(
      isError: false,
      isLoading: false,
      // movie: action,
    );
  } else if (action is ErrorFetchingConcreteRepertoireAction) {
    return state.copyWith(
      isError: true,
      isLoading: false,
      movie: null,
    );
  } else if (action is FetchMovieRepertoireAction) {
    return state.copyWith(
      isLoadingMovieRepertoire: true,
      isErrorMovieRepertoire: false,
      // movieRepertoire: [],
    );
  } else if (action is FinishFetchMovieRepertoireAction) {
    return state.copyWith(
      isLoadingMovieRepertoire: false,
      isErrorMovieRepertoire: false,
      // movieRepertoire: action.repertoire,
    );
  } else if (action is ErrorFetchingMovieRepertoireAction) {
    return state.copyWith(
      isLoadingMovieRepertoire: false,
      isErrorMovieRepertoire: true,
      // movieRepertoire: [],
    );
  }

  return state;
}
