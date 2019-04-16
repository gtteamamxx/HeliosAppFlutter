import 'package:helios_app/models/movie/movie_model.dart';
import 'package:helios_app/models/play_hour/play_hour_model.dart';

class MovieRepertoireModel {
  MovieRepertoireModel({
    this.id,
    this.playHours,
    this.movie,
  });

  final int id;
  final List<PlayHourModel> playHours;
  final MovieModel movie;
}
