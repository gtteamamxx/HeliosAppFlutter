import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:helios_app/other/service_locator.dart';

class NavigationService {
  navigateTo(
    BuildContext context,
    String route, {
    TransitionType transitionType,
  }) {
    final router = serviceLocator.get<Router>();
    router.navigateTo(
      context,
      route,
      transition: transitionType,
    );
  }
}
