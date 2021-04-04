import 'package:helios_app_flutter_x/models/pricing/pricing_model.dart';

class PricingPageState {
  PricingPageState({
    this.isLoading,
    this.isError,
    this.pricing,
  });

  final bool isLoading;
  final bool isError;
  final List<PricingModel> pricing;

  static PricingPageState initialState() {
    return PricingPageState(
      isError: false,
      isLoading: false,
      pricing: [],
    );
  }

  PricingPageState copyWith({
    bool isLoading,
    bool isError,
    List<PricingModel> pricing,
  }) {
    return PricingPageState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      pricing: pricing ?? this.pricing,
    );
  }
}
