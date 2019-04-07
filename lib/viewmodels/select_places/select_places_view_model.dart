import 'package:helios_app/models/place/place_model.dart';
import 'package:helios_app/models/repertoire/movie_repertoire.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/redux/select_places/select_places_page_state.dart';
import 'package:redux/redux.dart';

class SelectPlacesViewModel {
  SelectPlacesViewModel({
    this.isLoading,
    this.isError,
    this.movieRepertoire,
    this.places,
    this.repertoire,
  });

  final List<PlaceModel> places;
  final bool isLoading;
  final bool isError;
  final MovieRepertoireModel movieRepertoire;
  final RepertoireModel repertoire;

  static SelectPlacesViewModel fromStore(Store<AppState> store) {
    SelectPlacesPageState state = store.state.selectPlacesPageState;
    return SelectPlacesViewModel(
      isLoading: state.isLoading,
      isError: state.isError,
      places: state.places,
      movieRepertoire: state.movieRepertoire,
      repertoire: state.repertoire,
    );
  }
}
