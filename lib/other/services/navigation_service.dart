import 'package:helios_app/other/helpers/navigator_helper.dart';

class NavigationService {
  navigateTo(String route, Object arguments) {
    NavigatorHelper.navigatorKey.currentState
        .pushNamed(route, arguments: arguments);
  }
}
