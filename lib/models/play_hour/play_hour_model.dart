class PlayHourModel {
  PlayHourModel({
    this.id,
    this.date,
    this.repertoireMovieId,
    this.cinemaHallId,
  });

  final int id;
  final int repertoireMovieId;
  final int cinemaHallId;
  final DateTime date;
}
