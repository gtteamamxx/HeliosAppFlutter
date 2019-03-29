import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:helios_app/other/helpers/navigator_helper.dart';
import 'package:helios_app/other/service_locator.dart';

import 'package:helios_app/ui/home/home_page.dart';
import 'package:helios_app/ui/select_cinema/select_cinema_page.dart';

void configureRoutes() {
  Router router = serviceLocator.get<Router>();

  router.define('/',
      handler: _buildRoute<SelectCinemaPage>(SelectCinemaPage()));

  router.define('home', handler: _buildRoute<HomePage>(HomePage()));
}

Handler _buildRoute<T extends Widget>(T page) {
  return Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return page;
    },
  );
}
