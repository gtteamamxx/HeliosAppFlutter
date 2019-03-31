import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/other/helpers/navigator_helper.dart';
import 'package:helios_app/other/service_locator.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/ui/common/gradient_app_bar.dart';
import 'package:helios_app/viewmodels/gradient_app_bar/gradient_app_bar_view_model.dart';
import 'package:redux/redux.dart';
import 'package:helios_app/other/routes.dart';
import 'package:fluro/fluro.dart';

void main() {
  configureServiceLocator();
  configureRoutes();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(HeliosApp()),
  );
}

class HeliosApp extends StatelessWidget {
  final Store<AppState> store = configureStore();
  final Router router = serviceLocator.get<Router>();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: "Helios app",
        theme: ThemeData.dark().copyWith(
          accentColor: Colors.blue,
        ),
        onGenerateRoute: router.generator,
        navigatorKey: NavigatorHelper.navigatorKey,
        builder: (context, widget) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              StoreConnector<AppState, GradientAppBarViewModel>(
                converter: (store) => GradientAppBarViewModel.fromStore(store),
                builder: (context, viewModel) =>
                    _buildAppBar(context, viewModel),
              ),
              Flexible(
                child: widget,
              ),
            ],
          );
        },
      ),
    );
  }

  _buildAppBar(BuildContext context, GradientAppBarViewModel viewModel) {
    return GradientAppBar(
      title: viewModel.title,
      colorFrom: HeliosColors.appBarLeft,
      colorTo: HeliosColors.appBarRight,
      titleStyle: TextStyle(
        fontFamily: "Poppins",
        fontWeight: FontWeight.w100,
        color: Colors.white,
        fontSize: 20,
      ),
      showChangeCinemaButton: viewModel.showChangeCinemaButton,
      onChangeCinemaTap: () => viewModel.onChangeCinemaTap(),
    );
  }
}
