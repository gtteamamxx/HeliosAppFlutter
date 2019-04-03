import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/redux/actions/home/repertoire/fetch_repertoire_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/viewmodels/home/repertoire/repertoire_page_view_model.dart';

class RepertoirePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RepertoirePageViewModel>(
      converter: (store) => RepertoirePageViewModel.fromStore(store),
      onInit: (store) {
        store.dispatch(FetchRepertoireAction());
      },
      builder: (context, viewModel) {},
    );
  }
}
