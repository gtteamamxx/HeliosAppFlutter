import 'package:helios_app/models/pricing/price_day_model.dart';

class PricingModel {
  PricingModel({
    this.id,
    this.title,
    this.ruleDescription,
    this.days,
  });

  final int id;
  final String title;
  final String ruleDescription;
  final List<PriceDayModel> days;
}
