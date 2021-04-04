import 'package:get_it/get_it.dart';
import 'package:helios_app_flutter_x/other/services/abstract/cinema_service.dart';
import 'package:helios_app_flutter_x/other/services/mock/cinema_service_mock.dart';
import 'package:helios_app_flutter_x/other/services/navigation_service.dart';

GetIt serviceLocator = GetIt.asNewInstance();

void configureServiceLocator() {
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
