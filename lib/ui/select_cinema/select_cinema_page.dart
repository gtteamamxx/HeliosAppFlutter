import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app_flutter_x/models/cinema/cinema_model.dart';
import 'package:helios_app_flutter_x/other/helpers/helios_colors.dart';
import 'package:helios_app_flutter_x/redux/actions/app/change_app_bar_title_action.dart';
import 'package:helios_app_flutter_x/redux/actions/app/change_visibility_back_button_action.dart';
import 'package:helios_app_flutter_x/redux/actions/app/change_visiblity_change_cinema_button_action.dart';
import 'package:helios_app_flutter_x/redux/actions/select_cinema/fetch_cinemas_action.dart';
import 'package:helios_app_flutter_x/redux/app/app_state.dart';
import 'package:helios_app_flutter_x/ui/common/helios_text.dart';
import 'package:helios_app_flutter_x/viewmodels/select_cinema/select_cinema_view_model.dart';

import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

class SelectCinemaPage extends StatefulWidget {
  SelectCinemaPage({Key key}) : super(key: key);

  _SelectCinemaPageState createState() => _SelectCinemaPageState();
}

class _SelectCinemaPageState extends State<SelectCinemaPage> {
  final contentPadding = EdgeInsets.symmetric(horizontal: 15);
  final searchCinemaSubject = PublishSubject<Function>();
  StreamSubscription<Function> streamSubscription;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SelectCinemaViewModel>(
      converter: (store) => SelectCinemaViewModel.fromStore(store),
      onInit: (store) {
        store.dispatch(ChangeAppBarTitleAction("Które kino chcesz odwiedzić?"));
        store.dispatch(ChangeVisibilityOfChangeCinemaButtonAction(isVisible: false));
        store.dispatch(ChangeVisibilityOfBackButtonAction(isVisible: false));
        store.dispatch(FetchCinemasAction());
        this.streamSubscription = searchCinemaSubject.stream.debounce(Duration(milliseconds: 800)).listen((fetchCinemasFunction) => fetchCinemasFunction());
      },
      onDispose: (_) {
        streamSubscription.cancel();
      },
      builder: (context, viewModel) {
        return WillPopScope(
          onWillPop: () {
            if (viewModel.selectedCinema != null) {
              viewModel.onCinemaSelected(viewModel.selectedCinema);
            } else {
              SystemNavigator.pop();
            }

            return Future.value(false);
          },
          child: Scaffold(
            backgroundColor: HeliosColors.backgroundPrimary,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildSearchCinemaTextField(viewModel),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 200),
                    child: viewModel.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : viewModel.cinemas.isEmpty
                            ? _buildNoItemsWidget()
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: viewModel.cinemas.length,
                                itemBuilder: (_, index) {
                                  return Container(
                                    color: viewModel.isCinemaSelected(viewModel.cinemas[index])
                                        ? HeliosColors.selectedCinemaBackground.withAlpha(100)
                                        : Colors.transparent,
                                    child: InkWell(
                                      onTap: () => viewModel.onCinemaSelected(viewModel.cinemas[index]),
                                      child: _buildCinemaNameWidget(
                                        viewModel.cinemas[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildSearchCinemaTextField(SelectCinemaViewModel viewModel) {
    return Container(
      padding: this.contentPadding,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color: Colors.transparent,
        child: TextField(
          onChanged: (typedCinemaName) => searchCinemaSubject.add(() => viewModel.onCinemaNameChanged(typedCinemaName)),
          style: TextStyle(color: Colors.black45, fontSize: 20),
          decoration: InputDecoration(
            hintText: "Szukaj",
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }

  _buildCinemaNameWidget(CinemaModel cinema) {
    List<String> spltitedCinemaName = cinema.name.split('Helios');
    String cityName = spltitedCinemaName.first;
    String extendName = spltitedCinemaName.last;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HeliosText(
            cityName,
            fontWeight: FontWeight.w400,
          ),
          Text(
            "- Helios" + extendName,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }

  _buildNoItemsWidget() {
    return Column(
      children: <Widget>[HeliosText("Nie mamy kin w tej lokalziacji"), HeliosText("Spróbuj wpisać inną nazwę")],
    );
  }
}
