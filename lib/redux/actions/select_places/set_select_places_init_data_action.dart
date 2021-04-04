import 'package:helios_app_flutter_x/models/repertoire/movie_repertoire.dart';
import 'package:helios_app_flutter_x/models/repertoire/repertoire_model.dart';

class SetSelectPlacesInitDataAction {
  SetSelectPlacesInitDataAction({
    this.movieRepertoire,
    this.repertoire,
    this.playHourIndex,
  });

  final MovieRepertoireModel movieRepertoire;
  final RepertoireModel repertoire;
  final int playHourIndex;
}
