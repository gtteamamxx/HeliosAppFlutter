import 'package:helios_app/models/repertoire/movie_repertoire.dart';

class RepertoireModel {
  RepertoireModel({
    this.id,
    this.cinemaId,
    this.date,
    this.movies,
  });

  final int id;
  final int cinemaId;
  final DateTime date;
  final List<MovieRepertoireModel> movies;
}
