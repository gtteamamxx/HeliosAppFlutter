class MovieRepertoireModel {
  MovieRepertoireModel({
    this.id,
    this.cinemaId,
    this.date,
    this.playHours,
    this.repertoireId,
  });

  final int id;
  final int cinemaId;
  final int repertoireId;

  final DateTime date;
  final List<DateTime> playHours;
}
