import 'package:helios_app/redux/actions/home/repertoire/error_fetching_repertoire_action.dart';
import 'package:helios_app/redux/actions/home/repertoire/fetch_repertoire_action.dart';
import 'package:helios_app/redux/actions/home/repertoire/finish_fetch_repertoire_action.dart';
import 'package:helios_app/redux/home/repertoire/repertoire_page_state.dart';

RepertoirePageState repertoirePageStateReducer(
    RepertoirePageState state, action) {
  if (action is FetchRepertoireAction) {
    return state.copyWith(
      isLoading: true,
      isError: false,
      repertoire: [],
    );
  } else if (action is ErrorFetchingRepertoireAction) {
    return state.copyWith(
      isLoading: false,
      isError: true,
      repertoire: [],
    );
  } else if (action is FinishFetchRepertoireAction) {
    return state.copyWith(
      isLoading: false,
      isError: false,
      repertoire: [],
    );
  }
  return state;
}
