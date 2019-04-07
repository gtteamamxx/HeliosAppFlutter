import 'package:helios_app/models/place/place_model.dart';

class CinemaHallModel {
  CinemaHallModel({
    this.id,
    this.cinemaId,
    this.roomId,
    this.xLength,
    this.yLength,
  });

  final int id;
  final int cinemaId;
  final int roomId;
  final int xLength;
  final int yLength;
  List<PlaceModel> places;
}
