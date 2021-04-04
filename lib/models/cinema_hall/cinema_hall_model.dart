import 'package:helios_app_flutter_x/models/place/place_model.dart';

class CinemaHallModel {
  CinemaHallModel({
    this.id,
    this.cinemaId,
    this.roomId,
    this.sizeX,
    this.sizeY,
    this.screenLength,
    this.screenOffset,
  });

  final int id;
  final int cinemaId;
  final int roomId;
  final int sizeX;
  final int sizeY;
  final int screenLength;
  final int screenOffset;

  List<PlaceModel> places;
}
