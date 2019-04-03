import 'package:helios_app/models/repertoire/repertoire_date_model.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/redux/home/repertoire/repertoire_page_state.dart';
import 'package:redux/redux.dart';

class RepertoirePageViewModel {
  RepertoirePageViewModel({
    this.isLoading,
    this.isError,
    this.repertoire,
  });

  final bool isLoading;
  final bool isError;
  final List<RepertoireDateModel> repertoire;

  static RepertoirePageViewModel fromStore(Store<AppState> store) {
    RepertoirePageState state = store.state.homeState.repertoirePageState;
    return RepertoirePageViewModel(
      isLoading: state.isLoading,
      isError: state.isError,
      repertoire: state.repertoire,
    );
  }
}
