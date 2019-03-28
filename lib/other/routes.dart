import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:helios_app/other/service_locator.dart';

import 'package:helios_app/ui/home/home_page.dart';
import 'package:helios_app/ui/select_cinema/select_cinema_page.dart';

void configureRoutes() {
  Router router = serviceLocator.get<Router>();

  router.define(
    'home',
    handler: _buildRoute<HomePage>(
      HomePage(),
    ),
  );

  router.define(
    'select-cinema',
    handler: _buildRoute<SelectCinemaPage>(
      SelectCinemaPage(),
    ),
  );
}

Handler _buildRoute<T extends Widget>(
  T page,
) {
  return new Handler(handlerFunc: (
    BuildContext context,
    Map<String, dynamic> params,
  ) {
    return page;
  });
}
