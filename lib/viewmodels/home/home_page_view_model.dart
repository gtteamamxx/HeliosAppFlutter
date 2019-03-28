import 'package:helios_app/models/home/page_enum.dart';
import 'package:helios_app/redux/actions/home/change_home_page_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:redux/redux.dart';

typedef OnChangePage = void Function(int index);

class HomePageViewModel {
  HomePageViewModel({
    this.selectedPage,
    this.onChangePage,
  });

  final PageEnum selectedPage;
  final OnChangePage onChangePage;

  static fromStore(Store<AppState> store) {
    return HomePageViewModel(
      selectedPage: store.state.homeState.selectedPage,
      onChangePage: (index) => changePageByIndex(index, store),
    );
  }

  static changePageByIndex(int index, Store<AppState> store) {
    PageEnum pageToChange = PageEnum.values[index];
    store.dispatch(
      ChangeHomePageAction(
        page: pageToChange,
      ),
    );
  }

  int getSelectedPageIndex() {
    return selectedPage.index;
  }
}
