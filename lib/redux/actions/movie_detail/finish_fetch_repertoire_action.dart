import 'package:helios_app/models/repertoire/movie_repertoire.dart';

class FinishFetchMovieRepertoireAction {
  FinishFetchMovieRepertoireAction(this.repertoire);

  final List<MovieRepertoireModel> repertoire;
}
