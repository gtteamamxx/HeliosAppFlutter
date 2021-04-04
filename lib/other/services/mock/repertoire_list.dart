import 'package:helios_app_flutter_x/models/repertoire/repertoire_model.dart';
import 'package:helios_app_flutter_x/other/services/mock/movie_repertoire_list.dart';

List<RepertoireModel> asd = [];

List<RepertoireModel> repertoireMockData = [
  RepertoireModel(
    id: 0,
    cinemaId: 0,
    date: DateTime(2019, 4, 3),
    movies: movieRepertoireMock..shuffle(),
  ),
  RepertoireModel(
    id: 1,
    cinemaId: 0,
    date: DateTime(2019, 4, 4),
    movies: movieRepertoireMock..shuffle(),
  ),
  RepertoireModel(
    id: 2,
    cinemaId: 0,
    date: DateTime(2019, 4, 5),
    movies: movieRepertoireMock..shuffle(),
  ),
  RepertoireModel(
    id: 3,
    cinemaId: 0,
    date: DateTime(2019, 4, 6),
    movies: movieRepertoireMock..shuffle(),
  ),
  RepertoireModel(
    id: 4,
    cinemaId: 0,
    date: DateTime(2019, 4, 7),
    movies: movieRepertoireMock..shuffle(),
  ),
  RepertoireModel(
    id: 5,
    cinemaId: 0,
    date: DateTime(2019, 4, 8),
    movies: movieRepertoireMock..shuffle(),
  ),
  RepertoireModel(
    id: 6,
    cinemaId: 0,
    date: DateTime(2019, 4, 9),
    movies: movieRepertoireMock..shuffle(),
  ),
  RepertoireModel(
    id: 7,
    cinemaId: 0,
    date: DateTime(2019, 4, 10),
    movies: movieRepertoireMock..shuffle(),
  ),
];
