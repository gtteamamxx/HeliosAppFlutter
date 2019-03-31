import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/models/ui/home/page_enum.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/redux/actions/app/change_app_bar_title_action.dart';
import 'package:helios_app/redux/actions/app/change_visiblity_change_cinema_button_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/resources/helios_fonts/helios_icons_icons.dart';
import 'package:helios_app/viewmodels/home/home_page_view_model.dart';
import 'package:flushbar/flushbar.dart';

class HomePage extends StatelessWidget {
  final Duration timeUntilUserCanCloseApp = Duration(seconds: 2);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageViewModel>(
      converter: (store) => HomePageViewModel.fromStore(store),
      onInit: (store) {
        store
            .dispatch(ChangeAppBarTitleAction(store.state.selectedCinema.name));
        store.dispatch(
            ChangeVisibilityOfChangeCinemaButtonAction(isVisible: true));
      },
      builder: (context, viewModel) => Scaffold(
            backgroundColor: HeliosColors.backgroundPrimary,
            bottomNavigationBar: Material(
              color: HeliosColors.backgroundSecondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  viewModel.buildNavigationItem(
                    title: "Główna",
                    icon: HeliosIcons.home_icon,
                    page: PageEnum.Home,
                  ),
                  viewModel.buildNavigationItem(
                    title: "Cennik",
                    icon: HeliosIcons.pricing_icon,
                    page: PageEnum.Pricing,
                  ),
                  viewModel.buildNavigationItem(
                    title: "Repertuar",
                    icon: HeliosIcons.repertoire_icon,
                    page: PageEnum.Repertoire,
                  ),
                  viewModel.buildNavigationItem(
                    title: "Więcej",
                    icon: HeliosIcons.more_icon,
                    page: PageEnum.More,
                  )
                ],
              ),
            ),
            body: WillPopScope(
              onWillPop: () => _closeAppWhenRequest(context),
              child: viewModel.pages.isEmpty ||
                      viewModel.getSelectedPageIndex() >= viewModel.pages.length
                  ? Container()
                  : PageView(
                      children: viewModel.pages,
                      controller: viewModel.pageController,
                      onPageChanged: (index) => viewModel.onChangePage(index),
                    ),
            ),
          ),
    );
  }

  Future<bool> _closeAppWhenRequest(BuildContext context) {
    bool _shouldCloseApp = true;

    Future.delayed(timeUntilUserCanCloseApp, () {
      _shouldCloseApp = false;
    });

    Flushbar(
      message: "Naciśnij wstecz jeszcze raz, aby wyjśc z aplikacji",
      duration: timeUntilUserCanCloseApp,
      flushbarPosition: FlushbarPosition.BOTTOM,
      backgroundColor: Colors.blue,
      animationDuration: Duration(milliseconds: 200),
    )
      ..onStatusChanged = (status) {
        if (status == FlushbarStatus.DISMISSED) {
          if (_shouldCloseApp) {
            SystemNavigator.pop();
          }
        }
      }
      ..show(context);

    return Future.value(false);
  }
}
