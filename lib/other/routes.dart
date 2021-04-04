import 'package:flutter/material.dart';
import 'package:helios_app_flutter_x/ui/common/image_details.dart';
import 'package:helios_app_flutter_x/ui/home/home_page.dart';
import 'package:helios_app_flutter_x/ui/movie_detail/movie_detail_page.dart';
import 'package:helios_app_flutter_x/ui/select_cinema/select_cinema_page.dart';
import 'package:helios_app_flutter_x/ui/select_places/select_places.dart';

Route<dynamic> routes(RouteSettings settings) {
  if (settings.name == '/') {
    return _buildRoute(SelectCinemaPage());
  } else if (settings.name == '/home') {
    return _buildRoute(HomePage());
  } else if (settings.name == '/movie-detail') {
    return _buildRoute(MovieDetailPage());
  } else if (settings.name == '/image-details') {
    return _buildImageViewer(settings);
  } else if (settings.name == '/select-places') {
    return _buildRoute(SelectPlaces());
  }

  throw Exception('Nie obsluzony routing');
}

Route _buildImageViewer(RouteSettings settings) {
  return MaterialPageRoute(
    maintainState: true,
    builder: (BuildContext context) {
      return ImageDetails(
        heroTag: 'image-details',
        imageProvider: NetworkImage(settings.arguments),
      );
    },
  );
}

Route<dynamic> _buildRoute(page) {
  return MaterialPageRoute(
    maintainState: true,
    builder: (BuildContext context) {
      return page;
    },
  );
}
