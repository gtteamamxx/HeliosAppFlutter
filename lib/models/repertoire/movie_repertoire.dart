class MovieRepertoireModel {
  MovieRepertoireModel({
    this.id,
    this.cinemaId,
    this.cinemaHallId,
    this.date,
    this.playHours,
    this.repertoireId,
  });

  final int id;
  final int cinemaId;
  final int repertoireId;
  final int cinemaHallId;

  final DateTime date;
  final List<DateTime> playHours;
}
