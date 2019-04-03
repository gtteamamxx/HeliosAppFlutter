import 'package:flutter/material.dart';
import 'package:helios_app/models/repertoire/repertoire_date_model.dart';
import 'package:helios_app/redux/actions/home/repertoire/fetch_repertoire_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/redux/home/repertoire/repertoire_page_state.dart';
import 'package:redux/redux.dart';

class RepertoirePageViewModel {
  RepertoirePageViewModel({
    this.isLoading,
    this.isError,
    this.repertoire,
    this.onRefreshClick,
  });

  final bool isLoading;
  final bool isError;
  final List<RepertoireDateModel> repertoire;

  final VoidCallback onRefreshClick;

  static RepertoirePageViewModel fromStore(Store<AppState> store) {
    RepertoirePageState state = store.state.homeState.repertoirePageState;
    return RepertoirePageViewModel(
      isLoading: state.isLoading,
      isError: state.isError,
      repertoire: state.repertoire,
      onRefreshClick: () => _refreshRepertoire(store),
    );
  }

  static _refreshRepertoire(Store<AppState> store) {
    store.dispatch(FetchRepertoireAction());
  }
}
