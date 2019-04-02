import 'package:flutter/material.dart';
import 'package:helios_app/other/helpers/colors_helper.dart';
import 'package:helios_app/other/helpers/constants.dart';

class HeliosColors {
  static final Color appBarLeft = getColorByHex(Constants.appBarLeftColorHex);
  static final Color appBarRight = getColorByHex(Constants.appBarRightColorHex);
  static final Color backgroundPrimary =
      getColorByHex(Constants.backgroundPrimaryColorHex);
  static final Color backgroundSecondary =
      getColorByHex(Constants.backgroundSecondaryColorHex);
  static final Color backgroundTertiary =
      getColorByHex(Constants.backgroundTertiaryColorHex);
  static final Color backgroundFourth =
      getColorByHex(Constants.backgroundFourthColorHex);
  static final Color homeIconActive = getColorByHex(Constants.homeIconColorHex);
  static final Color homeIconNotActive =
      getColorByHex(Constants.homeIconNotActiveHex);
  static final Color selectedCinemaBackground =
      getColorByHex(Constants.selectedCinemaBackgroundHex);

  static final Color categoryFontColor =
      getColorByHex(Constants.categoryColorHex);

  static final Color pricingPagePricingTypeColor =
      getColorByHex(Constants.pricingPagePricingTypeColorHex);

  static final Color pricingPagePricingGridBackground =
      getColorByHex(Constants.pricingPagePricingGridBackgroundColorHex);

  static Color getColorByHex(String hex) {
    return Color(getColorHexFromStr(hex));
  }
}
