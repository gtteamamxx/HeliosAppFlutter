import 'package:fluro/fluro.dart';
import 'package:helios_app/other/helpers/navigator_helper.dart';

class NavigationService {
  navigateTo(String route, {TransitionType transitionType}) {
    NavigatorHelper.navigatorKey.currentState
        .pushNamedAndRemoveUntil(route, (x) => x.isActive);
  }
}
