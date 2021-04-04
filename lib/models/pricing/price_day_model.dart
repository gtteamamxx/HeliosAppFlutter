import 'package:helios_app_flutter_x/models/pricing/price_model.dart';

class PriceDayModel {
  PriceDayModel({
    this.id,
    this.dayName,
    this.prices,
  });

  final int id;
  final String dayName;
  final List<PriceModel> prices;
}
