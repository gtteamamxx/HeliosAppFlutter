class SelectCinemaState {
  SelectCinemaState({
    this.cinemas,
    this.isLoading,
  });

  final List<String> cinemas;
  final bool isLoading;

  static SelectCinemaState initialState() {
    return SelectCinemaState(
      cinemas: [],
      isLoading: false,
    );
  }

  SelectCinemaState copyWith({
    List<String> cinemas,
    bool isLoading,
  }) {
    return SelectCinemaState(
      cinemas: cinemas ?? this.cinemas,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
