import 'package:helios_app/redux/actions/select_places/set_select_places_init_data_action.dart';
import 'package:helios_app/redux/select_places/select_places_page_state.dart';

SelectPlacesPageState selectPlacesPageStateReducer(
    SelectPlacesPageState state, dynamic action) {
  if (action is SetSelectPlacesInitDataAction) {
    return state.copyWith(
      movieRepertoire: action.movieRepertoire,
      repertoire: action.repertoire,
      // playHourIndex: action.playHourIndex,
    );
  }
  return state;
}
