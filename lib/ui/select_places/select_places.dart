import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/viewmodels/select_places/select_places_view_model.dart';

class SelectPlaces extends StatefulWidget {
  @override
  _SelectPlacesState createState() => _SelectPlacesState();
}

class _SelectPlacesState extends State<SelectPlaces> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SelectPlacesViewModel>(
      converter: (store) => SelectPlacesViewModel.fromStore(store),
      onInit: (store) {},
      builder: (context, viewModel) {
        return Container(child: Text('work'));
      },
    );
  }
}
