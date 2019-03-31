import 'package:flutter/material.dart';
import 'package:helios_app/models/ui/home/page_enum.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/redux/actions/home/change_home_page_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/ui/home/main/main_page.dart';
import 'package:helios_app/ui/home/pricing/pricing_page.dart';
import 'package:redux/redux.dart';

typedef OnChangePage = void Function(int index);

class HomePageViewModel {
  HomePageViewModel({
    this.selectedPage,
    this.onChangePage,
    this.pages,
    this.pageController,
  });

  final PageEnum selectedPage;
  final OnChangePage onChangePage;
  final List<Widget> pages;
  final PageController pageController;

  static fromStore(Store<AppState> store) {
    return HomePageViewModel(
      selectedPage: store.state.homeState.selectedPage,
      onChangePage: (index) => changePageByIndex(index, store),
      pageController:
          PageController(initialPage: store.state.homeState.selectedPage.index),
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

  Widget buildNavigationItem({String title, IconData icon, PageEnum page}) {
    bool isSelected = page == this.selectedPage;
    Color color = isSelected
        ? HeliosColors.homeIconActive
        : HeliosColors.homeIconNotActive;

    return InkWell(
      onTap: () {
        this.onChangePage(page.index);
        this.pageController.animateToPage(
              page.index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
      },
      borderRadius: BorderRadius.circular(45),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            Text(
              title,
              style: TextStyle(fontSize: 12, color: color),
            )
          ],
        ),
      ),
    );
  }
}
