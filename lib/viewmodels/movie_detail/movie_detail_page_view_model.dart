import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/redux/movie_detail/movie_detail_page_state.dart';
import 'package:redux/redux.dart';

class MovieDetailPageViewModel {
  MovieDetailPageViewModel({
    this.repertoire,
    this.isLoading,
    this.isError,
  });

  final RepertoireModel repertoire;
  final bool isError;
  final bool isLoading;

  static MovieDetailPageViewModel fromStore(Store<AppState> store) {
    MovieDetailPageState state = store.state.movieDetailPageState;
    return MovieDetailPageViewModel(
      repertoire: state.repertoire,
      isError: state.isError,
      isLoading: state.isLoading,
    );
  }
}
