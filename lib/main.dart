import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/other/service_locator.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';
import 'package:helios_app/other/routes.dart';
import 'package:fluro/fluro.dart';

void main() {
  debugDisableShadows = false;
  configureServiceLocator();
  configureRoutes();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
          HeliosApp(),
        ),
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
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme: ThemeData.dark(),
        home: Container(),
        initialRoute: '/select-cinema',
        onGenerateRoute: router.generator,
      ),
    );
  }
}
