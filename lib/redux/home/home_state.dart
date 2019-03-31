import 'package:flutter/material.dart';
import 'package:helios_app/models/ui/home/page_enum.dart';
import 'package:helios_app/ui/home/main/main_page.dart';
import 'package:helios_app/ui/home/pricing/pricing_page.dart';
import 'package:meta/meta.dart';

class HomeState {
  HomeState({
    @required this.selectedPage,
    @required this.pages,
  });

  final PageEnum selectedPage;
  final List<Widget> pages;

  static HomeState intiialState() {
    return HomeState(
      selectedPage: PageEnum.Home,
      pages: [
        MainPage(),
        PricingPage(),
      ],
    );
  }

  HomeState copyWith({
    PageEnum selectedPage,
    List<Widget> pages,
  }) {
    return HomeState(
      selectedPage: selectedPage ?? this.selectedPage,
      pages: pages ?? this.pages,
    );
  }
}
