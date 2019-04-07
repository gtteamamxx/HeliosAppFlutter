import 'package:helios_app/models/repertoire/movie_repertoire.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';

class ShowSelectPlacesAction {
  ShowSelectPlacesAction({
    this.movieRepertoire,
    this.repertoire,
    this.playHourIndex,
  });

  final MovieRepertoireModel movieRepertoire;
  final RepertoireModel repertoire;
  final int playHourIndex;
}
