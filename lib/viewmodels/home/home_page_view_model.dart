import 'package:flutter/material.dart';
import 'package:helios_app_flutter_x/models/ui/home/page_enum.dart';
import 'package:helios_app_flutter_x/other/helpers/helios_colors.dart';
import 'package:helios_app_flutter_x/redux/actions/home/change_home_page_action.dart';
import 'package:helios_app_flutter_x/redux/app/app_state.dart';
import 'package:helios_app_flutter_x/ui/common/helios_text.dart';
import 'package:redux/redux.dart';

typedef OnChangePage = void Function(int index);

class HomePageViewModel {
  HomePageViewModel({
    this.selectedPage,
    this.onChangePage,
    this.pages,
  });

  final PageEnum selectedPage;
  final OnChangePage onChangePage;
  final List<Widget> pages;

  static fromStore(Store<AppState> store) {
    return HomePageViewModel(
      selectedPage: store.state.homeState.selectedPage,
      onChangePage: (index) => changePageByIndex(index, store),
      pages: store.state.homeState.pages,
    );
  }

  static changePageByIndex(int index, Store<AppState> store) {
    PageEnum pageToChange = PageEnum.values[index];
    store.dispatch(ChangeHomePageAction(page: pageToChange));
  }

  int getSelectedPageIndex() {
    return selectedPage.index;
  }

  Widget buildNavigationItem({String title, IconData icon, PageEnum page, OnChangePage onTap}) {
    bool isSelected = page == this.selectedPage;
    Color color = isSelected ? HeliosColors.homeIconActive : HeliosColors.homeIconNotActive;

    return InkWell(
      onTap: () {
        onTap(page.index);
      },
      borderRadius: BorderRadius.circular(45),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            HeliosText(
              title,
              color: color,
              fontSize: 12,
            ),
          ],
        ),
      ),
    );
  }
}
