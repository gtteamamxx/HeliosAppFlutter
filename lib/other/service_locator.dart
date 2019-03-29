import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:fluro/fluro.dart';
import 'package:helios_app/other/helpers/navigator_helper.dart';
import 'package:helios_app/other/services/abstract/cinema_service.dart';
import 'package:helios_app/other/services/mock/cinema_service_mock.dart';
import 'package:helios_app/other/services/navigation_service.dart';

GetIt serviceLocator = GetIt();

void configureServiceLocator() {
  serviceLocator.registerSingleton<Router>(new Router());
  serviceLocator.registerSingleton<NavigationService>(NavigationService());

  bool prod = false;

  if (prod) {
    registerProductionServices();
  } else {
    registerMockServices();
  }
}

registerProductionServices() {}

registerMockServices() {
  serviceLocator.registerSingleton<CinemaService>(CinemaServiceMock());
}
