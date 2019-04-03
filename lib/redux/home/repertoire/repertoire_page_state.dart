import 'package:helios_app/models/repertoire/repertoire_date_model.dart';

class RepertoirePageState {
  RepertoirePageState({this.isLoading, this.isError, this.repertoire});

  final bool isLoading;
  final bool isError;
  final List<RepertoireDateModel> repertoire;

  static RepertoirePageState initialState() {
    return RepertoirePageState(
      isLoading: false,
      isError: false,
      repertoire: [],
    );
  }

  RepertoirePageState copyWith({
    bool isLoading,
    bool isError,
    List<RepertoireDateModel> repertoire,
  }) {
    return RepertoirePageState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      repertoire: repertoire ?? this.repertoire,
    );
  }
}
