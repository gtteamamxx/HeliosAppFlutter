import 'package:flutter/material.dart';
import 'package:helios_app/models/ui/home/page_enum.dart';
import 'package:helios_app/redux/home/main/main_page_state.dart';
import 'package:helios_app/redux/home/pricing/pricing_page_state.dart';
import 'package:helios_app/redux/home/repertoire/repertoire_page_state.dart';
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
    @required this.repertoirePageState,
  });

  final PageEnum selectedPage;
  final List<Widget> pages;

  final MainPageState mainPageState;
  final PricingPageState pricingPageState;
  final RepertoirePageState repertoirePageState;

  static HomeState intiialState() {
    return HomeState(
      selectedPage: PageEnum.Home,
      mainPageState: MainPageState.initialState(),
      pricingPageState: PricingPageState.initialState(),
      repertoirePageState: RepertoirePageState.initialState(),
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
    RepertoirePageState repertoirePageState,
  }) {
    return HomeState(
      selectedPage: selectedPage ?? this.selectedPage,
      mainPageState: mainPageState ?? this.mainPageState,
      pricingPageState: pricingPageState ?? this.pricingPageState,
      repertoirePageState: repertoirePageState ?? this.repertoirePageState,
      pages: pages ?? this.pages,
    );
  }
}
