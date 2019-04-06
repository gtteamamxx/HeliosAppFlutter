import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/redux/actions/show_image_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/redux/movie_detail/movie_detail_page_state.dart';
import 'package:redux/redux.dart';

typedef ImageTap = Function(String url);

class MovieDetailPageViewModel {
  MovieDetailPageViewModel(
      {this.repertoire, this.isLoading, this.isError, this.onImageTap});

  final RepertoireModel repertoire;
  final bool isError;
  final bool isLoading;
  final ImageTap onImageTap;

  static MovieDetailPageViewModel fromStore(Store<AppState> store) {
    MovieDetailPageState state = store.state.movieDetailPageState;
    return MovieDetailPageViewModel(
      repertoire: state.repertoire,
      isError: state.isError,
      isLoading: state.isLoading,
      onImageTap: (url) => _showImageByUrl(store, url),
    );
  }

  static _showImageByUrl(Store<AppState> store, String url) {
    store.dispatch(ShowImageAction(imageUrl: url));
  }
}
