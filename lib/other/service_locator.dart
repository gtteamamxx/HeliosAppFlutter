import 'package:get_it/get_it.dart';
import 'package:fluro/fluro.dart';
import 'package:helios_app/other/services/navigation_service.dart';

GetIt serviceLocator = GetIt();

void configureServiceLocator() {
  serviceLocator.registerSingleton<Router>(new Router());
  serviceLocator.registerSingleton<NavigationService>(NavigationService());
}
