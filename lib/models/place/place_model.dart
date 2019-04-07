import 'package:helios_app/models/place/place_state_enum.dart';
import 'package:helios_app/models/place/place_type_enum.dart';

class PlaceModel {
  PlaceModel({
    this.id,
    this.x,
    this.y,
    this.type,
    this.state,
  });

  final int id;
  final int x;
  final int y;
  final PlaceType type;
  final PlaceState state;
}
