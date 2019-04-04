import 'package:helios_app/models/repertoire/repertoire_model.dart';

class ShowMovieDetailAction {
  ShowMovieDetailAction({this.repertoire});
  final RepertoireModel repertoire;
}

class ShowMovieDetailByIdAction {
  ShowMovieDetailByIdAction({this.repertoireId});
  final int repertoireId;
}
