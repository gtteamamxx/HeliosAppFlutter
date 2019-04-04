import 'package:flutter/material.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';

import 'package:helios_app/ui/home/home_page.dart';
import 'package:helios_app/ui/movie_detail/movie_detail_page.dart';
import 'package:helios_app/ui/select_cinema/select_cinema_page.dart';

Route<dynamic> routes(RouteSettings settings) {
  if (settings.name == '/') {
    return _buildRoute(SelectCinemaPage());
  } else if (settings.name == '/home') {
    return _buildRoute(HomePage());
  } else if (settings.name == '/movie-detail') {
    return _buildRoute(MovieDetailPage());
  }

  throw Exception('Nie obsluzony routing');
}

Route<dynamic> _buildRoute(page) {
  return MaterialPageRoute(
    builder: (BuildContext context) {
      return page;
    },
  );
}
