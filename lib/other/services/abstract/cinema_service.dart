import 'package:helios_app/models/cinema/cinema_model.dart';

abstract class CinemaService {
  Future<List<CinemaModel>> getListOfCinemas(String searchText);
}
