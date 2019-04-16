import 'package:helios_app/models/repertoire/movie_repertoire.dart';
import 'package:meta/meta.dart';

class ShowMovieDetailAction {
  ShowMovieDetailAction({this.movieRepertoire});
  final MovieRepertoireModel movieRepertoire;
}

class ShowMovieDetailByIdAction {
  ShowMovieDetailByIdAction({
    @required this.movieId,
    @required this.repertoireId,
    @required this.cinemaId,
  });

  final int repertoireId;
  final int movieId;
  final int cinemaId;
}
