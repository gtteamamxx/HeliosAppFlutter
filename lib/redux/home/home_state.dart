import 'package:flutter/material.dart';
import 'package:helios_app/models/ui/home/page_enum.dart';
import 'package:helios_app/redux/home/main/main_page_state.dart';
import 'package:helios_app/redux/home/pricing/pricing_page_state.dart';
import 'package:helios_app/ui/home/main/main_page.dart';
import 'package:helios_app/ui/home/pricing/pricing_page.dart';
import 'package:helios_app/ui/home/repertoire/repertoire_page.dart';
import 'package:meta/meta.dart';

class HomeState {
  HomeState({
    @required this.selectedPage,
    @required this.pages,
    @required this.mainPageState,
    @required this.pricingPageState,
  });

  final PageEnum selectedPage;
  final List<Widget> pages;
  final MainPageState mainPageState;
  final PricingPageState pricingPageState;

  static HomeState intiialState() {
    return HomeState(
      selectedPage: PageEnum.Home,
      mainPageState: MainPageState.initialState(),
      pricingPageState: PricingPageState.initialState(),
      pages: [
        MainPage(),
        PricingPage(),
        RepertoirePage(),
      ],
    );
  }

  HomeState copyWith({
    PageEnum selectedPage,
    List<Widget> pages,
    MainPageState mainPageState,
    PricingPageState pricingPageState,
  }) {
    return HomeState(
      selectedPage: selectedPage ?? this.selectedPage,
      mainPageState: mainPageState ?? this.mainPageState,
      pages: pages ?? this.pages,
      pricingPageState: pricingPageState ?? this.pricingPageState,
    );
  }
}
