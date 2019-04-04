import 'package:helios_app/other/helpers/navigator_helper.dart';

class NavigationService {
  navigateTo(String route) {
    NavigatorHelper.navigatorKey.currentState
        .pushNamedAndRemoveUntil(route, (x) => x.isFirst);
  }
}
