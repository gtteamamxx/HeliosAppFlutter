import 'package:flutter/material.dart';
import 'package:helios_app/models/pricing/pricing_model.dart';
import 'package:helios_app/redux/actions/home/pricing/fetch_pricing_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/redux/home/pricing/pricing_page_state.dart';
import 'package:redux/redux.dart';

class PricingPageViewModel {
  PricingPageViewModel({
    this.isLoading,
    this.isError,
    this.pricing,
    this.onRefreshClick,
  });

  final bool isLoading;
  final bool isError;
  final List<PricingModel> pricing;
  final VoidCallback onRefreshClick;

  static PricingPageViewModel fromStore(Store<AppState> store) {
    PricingPageState state = store.state.homeState.pricingPageState;
    return PricingPageViewModel(
      isLoading: state.isError,
      isError: state.isError,
      pricing: state.pricing,
      onRefreshClick: () => _refreshPricing(store),
    );
  }

  static _refreshPricing(Store<AppState> store) {
    store.dispatch(FetchPricingAction());
  }
}
