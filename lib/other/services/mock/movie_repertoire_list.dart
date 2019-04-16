import 'dart:math';

import 'package:helios_app/models/play_hour/play_hour_model.dart';
import 'package:helios_app/models/repertoire/movie_repertoire.dart';
import 'package:helios_app/other/services/mock/movies_list.dart';

get movieRepertoireMock {
  return moviesMock
      .map(
        (movie) => MovieRepertoireModel(
              id: 0,
              movie: movie,
              playHours: List.generate(Random.secure().nextInt(12) + 1, (id) {
                return PlayHourModel(
                  cinemaHallId: Random.secure().nextInt(1),
                  date: DateTime(2019, 4, 3, 8 + id, id < 7 ? 0 : 30),
                );
              }),
            ),
      )
      .toList();
}
