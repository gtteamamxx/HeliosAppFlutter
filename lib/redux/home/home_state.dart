import 'package:flutter/material.dart';
import 'package:helios_app/models/ui/home/page_enum.dart';
import 'package:helios_app/redux/home/main/main_page_state.dart';
import 'package:helios_app/ui/home/main/main_page.dart';
import 'package:helios_app/ui/home/pricing/pricing_page.dart';
import 'package:meta/meta.dart';

class HomeState {
  HomeState({
    @required this.selectedPage,
    @required this.pages,
    @required this.mainPageState,
  });

  final PageEnum selectedPage;
  final List<Widget> pages;
  final MainPageState mainPageState;

  static HomeState intiialState() {
    return HomeState(
      selectedPage: PageEnum.Home,
      mainPageState: MainPageState.initialState(),
      pages: [
        MainPage(),
        PricingPage(),
      ],
    );
  }

  HomeState copyWith({
    PageEnum selectedPage,
    List<Widget> pages,
    MainPageState mainPageState,
  }) {
    return HomeState(
      selectedPage: selectedPage ?? this.selectedPage,
      mainPageState: mainPageState ?? this.mainPageState,
      pages: pages ?? this.pages,
    );
  }
}
