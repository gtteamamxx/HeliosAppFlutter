import 'package:helios_app/models/ui/home/page_enum.dart';
import 'package:meta/meta.dart';

class HomeState {
  HomeState({@required this.selectedPage});

  final PageEnum selectedPage;

  static HomeState intiialState() {
    return HomeState(selectedPage: PageEnum.Home);
  }

  HomeState copyWith({PageEnum selectedPage}) {
    return HomeState(
      selectedPage: selectedPage,
    );
  }
}
