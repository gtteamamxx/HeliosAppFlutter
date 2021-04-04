import 'package:flutter/material.dart';
import 'package:helios_app_flutter_x/models/repertoire/movie_repertoire.dart';
import 'package:helios_app_flutter_x/redux/actions/movie_detail/fetch_movie_repertoire_action.dart';
import 'package:helios_app_flutter_x/redux/actions/show_image_action.dart';
import 'package:helios_app_flutter_x/redux/actions/show_select_places_action.dart';
import 'package:helios_app_flutter_x/redux/app/app_state.dart';
import 'package:helios_app_flutter_x/redux/movie_detail/movie_detail_page_state.dart';
import 'package:redux/redux.dart';

typedef ImageTap = Function(String url);
typedef SelectMovieRepertoireTap = Function(MovieRepertoireModel movieRepertoire, int playHourIndex);

class MovieDetailPageViewModel {
  MovieDetailPageViewModel({
    this.onImageTap,
    this.movieRepertoire,
    this.isLoadingMovieRepertoire,
    this.isErrorMovieRepertoire,
    this.onRefreshMovieRepertoireTap,
    this.selectedCinemaName,
    this.onSelectMovieRepertoireTap,
  });

  final ImageTap onImageTap;

  final MovieRepertoireModel movieRepertoire;
  final bool isLoadingMovieRepertoire;
  final bool isErrorMovieRepertoire;
  final VoidCallback onRefreshMovieRepertoireTap;

  final String selectedCinemaName;
  final SelectMovieRepertoireTap onSelectMovieRepertoireTap;

  static MovieDetailPageViewModel fromStore(Store<AppState> store) {
    MovieDetailPageState state = store.state.movieDetailPageState;
    return MovieDetailPageViewModel(
      onImageTap: (url) => _showImageByUrl(store, url),
      movieRepertoire: state.movieRepertoire,
      isErrorMovieRepertoire: state.isErrorMovieRepertoire,
      isLoadingMovieRepertoire: state.isLoadingMovieRepertoire,
      onRefreshMovieRepertoireTap: () => _refreshMovieRepertoire(store, state),
      selectedCinemaName: store.state.selectedCinema.name,
      onSelectMovieRepertoireTap: (movieRepertoire, playHourIndex) => _movieRepertoireSelected(store, movieRepertoire, playHourIndex),
    );
  }

  static _showImageByUrl(Store<AppState> store, String url) {
    store.dispatch(ShowImageAction(imageUrl: url));
  }

  static _refreshMovieRepertoire(Store<AppState> store, MovieDetailPageState state) {
    if (state.isLoadingMovieRepertoire) {
      return;
    }
    store.dispatch(FetchMovieRepertoireAction(movieId: state.movieRepertoire.movie.id));
  }

  static _movieRepertoireSelected(
    Store<AppState> store,
    MovieRepertoireModel movieRepertoire,
    int playHourIndex,
  ) {
    store.dispatch(ShowSelectPlacesAction(
      movieRepertoire: movieRepertoire,
      // repertoire: repertoire,
      playHourIndex: playHourIndex,
    ));
  }
}
