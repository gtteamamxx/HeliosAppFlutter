import 'package:flutter/material.dart';
import 'package:helios_app_flutter_x/models/repertoire/movie_repertoire.dart';
import 'package:helios_app_flutter_x/models/repertoire/repertoire_model.dart';
import 'package:helios_app_flutter_x/redux/actions/home/repertoire/fetch_repertoire_action.dart';
import 'package:helios_app_flutter_x/redux/actions/show_movie_detail_action.dart';
import 'package:helios_app_flutter_x/redux/app/app_state.dart';
import 'package:helios_app_flutter_x/redux/home/repertoire/repertoire_page_state.dart';
import 'package:redux/redux.dart';

typedef MovieRepertoireTap = Function(MovieRepertoireModel repertoire);

class RepertoirePageViewModel {
  RepertoirePageViewModel({
    this.isLoading,
    this.isError,
    this.repertoire,
    this.onRefreshTap,
    this.onMovieRepertoireTap,
  });

  final bool isLoading;
  final bool isError;
  final List<RepertoireModel> repertoire;

  final VoidCallback onRefreshTap;
  final MovieRepertoireTap onMovieRepertoireTap;

  static RepertoirePageViewModel fromStore(Store<AppState> store) {
    RepertoirePageState state = store.state.homeState.repertoirePageState;
    return RepertoirePageViewModel(
      isLoading: state.isLoading,
      isError: state.isError,
      repertoire: state.repertoire,
      onRefreshTap: () => _refreshRepertoire(store),
      onMovieRepertoireTap: (repertoire) => _showRepertoireDetails(store, repertoire),
    );
  }

  static _refreshRepertoire(Store<AppState> store) {
    store.dispatch(FetchRepertoireAction());
  }

  static _showRepertoireDetails(Store<AppState> store, MovieRepertoireModel movieRepertoire) {
    store.dispatch(ShowMovieDetailAction(movieRepertoire: movieRepertoire));
  }
}
