import 'package:helios_app_flutter_x/other/helpers/navigator_helper.dart';

class NavigationService {
  navigateTo(String route, Object arguments) {
    NavigatorHelper.navigatorKey.currentState.pushNamed(route, arguments: arguments);
  }
}
