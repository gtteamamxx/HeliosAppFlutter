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
      repertoire: null,
    );
  } else if (action is FinishFetchConcreteRepertoireAction) {
    return state.copyWith(
      isError: false,
      isLoading: false,
      repertoire: action.repertoire,
    );
  } else if (action is ErrorFetchingConcreteRepertoireAction) {
    return state.copyWith(
      isError: true,
      isLoading: false,
      repertoire: null,
    );
  }

  return state;
}
