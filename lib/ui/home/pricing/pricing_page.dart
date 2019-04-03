import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/models/pricing/price_model.dart';
import 'package:helios_app/models/pricing/pricing_model.dart';
import 'package:helios_app/models/ticket/ticket_model.dart';
import 'package:helios_app/other/helpers/constants.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/redux/actions/home/pricing/fetch_pricing_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/ui/common/helios_button.dart';
import 'package:helios_app/viewmodels/home/pricing/pricing_page_view_model.dart';

class PricingPage extends StatefulWidget {
  @override
  _PricingPageState createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage>
    with SingleTickerProviderStateMixin {
  int _selectedPricingIndex = 0;
  int _lastSelectedIndex = 0;
  AnimationController _animationController;
  Animation<Color> _changeColorAnimation;
  Animation<Color> _changeColorBackAnimation;

  List<int> _priceGridHeaderDaysIds;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400))
          ..addListener(() => setState(() {}));

    _changeColorAnimation = ColorTween(
            begin: Colors.white, end: HeliosColors.pricingPagePricingTypeColor)
        .animate(_animationController);

    _changeColorBackAnimation = ColorTween(
            begin: HeliosColors.pricingPagePricingTypeColor, end: Colors.white)
        .animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PricingPageViewModel>(
      converter: (store) => PricingPageViewModel.fromStore(store),
      onInit: (store) {
        store.dispatch(FetchPricingAction());
      },
      builder: (context, viewModel) {
        return AnimatedSwitcher(
          duration: Constants.fadeInDuration,
          child: _buildContent(viewModel),
        );
      },
    );
  }

  _buildContent(PricingPageViewModel viewModel) {
    if (viewModel.isLoading) {
      return _buildLoading();
    }
    if (viewModel.isError) {
      return _buildError(refreshClick: viewModel.onRefreshClick);
    }

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      children: <Widget>[
        _buildPriceTabs(pricing: viewModel.pricing),
        _buildPriceGrid(pricing: viewModel.pricing),
        _buildDescription(pricing: viewModel.pricing),
      ],
    );
  }

  _buildDescription({List<PricingModel> pricing}) {
    String description = pricing[_selectedPricingIndex].ruleDescription;
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(description),
    );
  }

  _buildPriceGrid({List<PricingModel> pricing}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10).copyWith(bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: HeliosColors.backgroundFifthColorHex,
      ),
      child: _buildPriceGridFromPricing(pricing),
    );
  }

  _buildPriceGridFromPricing(List<PricingModel> pricingList) {
    PricingModel pricing = pricingList[_selectedPricingIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildPriceGridHeader(pricing),
      ]..addAll(_buildTicketsSections(pricing)),
    );
  }

  _buildTicketsSections(PricingModel pricing) {
    Map<TicketModel, List<PriceIndentifiedByDayModel>> ticketPriceDict =
        _getTicketPriceDict(pricing);
    List<Widget> widgets = [];

    for (TicketModel ticket in ticketPriceDict.keys) {
      List<PriceIndentifiedByDayModel> prices = ticketPriceDict[ticket];
      widgets.addAll([
        SizedBox(height: 10),
        Text(
          ticket.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _priceGridHeaderDaysIds.map((dayId) {
            PriceIndentifiedByDayModel price = prices
                .firstWhere((x) => x.priceDayId == dayId, orElse: () => null);
            int index = _priceGridHeaderDaysIds.indexOf(dayId) + 1;
            return Expanded(
              child: price == null
                  ? Container()
                  : Text(
                      "${price.price.toStringAsFixed(2)} zł",
                      textAlign: index == _priceGridHeaderDaysIds.length
                          ? TextAlign.right
                          : index == 1 ? TextAlign.left : TextAlign.center,
                    ),
            );
          }).toList(),
        ),
        SizedBox(height: 4),
        Container(
          color: Colors.black.withAlpha(30),
          height: 1,
        ),
        SizedBox(height: 6),
      ]);
    }
    return widgets;
  }

  _buildPriceGridHeader(PricingModel pricing) {
    _priceGridHeaderDaysIds = [];
    return Row(
      children: pricing.days.map((day) {
        _priceGridHeaderDaysIds.add(day.id);
        return Expanded(
          child: Text(
            day.dayName,
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
            textAlign: _priceGridHeaderDaysIds.length == pricing.days.length
                ? TextAlign.right
                : _priceGridHeaderDaysIds.length == 1
                    ? TextAlign.left
                    : TextAlign.center,
          ),
        );
      }).toList(),
    );
  }

  _buildError({VoidCallback refreshClick}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Wystapił problem podczas pobierania cennika",
            style: TextStyle(fontFamily: "Poppins", fontSize: 16),
          ),
          SizedBox(height: 10),
          HeliosButton(content: "Spróbuj ponownie", onTap: refreshClick),
        ],
      ),
    );
  }

  _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  _buildPriceTabs({@required List<PricingModel> pricing}) {
    List<Widget> tabsWidgets = [];

    for (int i = 0; i < pricing.length; ++i) {
      PricingModel pricingModel = pricing[i];

      tabsWidgets.add(
        Container(
          child: InkWell(
            onTap: () {
              setState(() {
                _lastSelectedIndex = _selectedPricingIndex;
                if (_selectedPricingIndex == i) {
                  return;
                }
                _selectedPricingIndex = i;
                if (_animationController.isCompleted) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
              });
            },
            child: Text(
              pricingModel.title,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 17,
                color: _getColorForButtonIndex(index: i),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tabsWidgets,
      ),
    );
  }

  Color _getColorForButtonIndex({@required int index}) {
    if (!_animationController.isAnimating) {
      if (index == _selectedPricingIndex) {
        return Colors.white;
      } else {
        return HeliosColors.pricingPagePricingTypeColor;
      }
    } else {
      bool isAnimForrward =
          _animationController.status == AnimationStatus.forward;
      if (index == _selectedPricingIndex) {
        return isAnimForrward
            ? _changeColorBackAnimation.value
            : _changeColorAnimation.value;
      } else if (index == _lastSelectedIndex) {
        return isAnimForrward
            ? _changeColorAnimation.value
            : _changeColorBackAnimation.value;
      }

      return HeliosColors.pricingPagePricingTypeColor;
    }
  }

  Map<TicketModel, List<PriceIndentifiedByDayModel>> _getTicketPriceDict(
      PricingModel pricing) {
    var tickets = Map<TicketModel, List<PriceIndentifiedByDayModel>>();

    for (var dayPrice in pricing.days.map((x) => [x.id, x.prices])) {
      List<PriceModel> prices = dayPrice[1];
      int dayId = dayPrice[0];

      for (PriceModel price in prices) {
        if (!tickets.keys.any((x) => x.id == price.ticket.id)) {
          tickets[price.ticket] = List<PriceIndentifiedByDayModel>()
            ..add(mapToPriceIndentifiedByDayModel(dayId, price));
        } else {
          List<PriceIndentifiedByDayModel> pair =
              tickets[tickets.keys.firstWhere((x) => x.id == price.ticket.id)];
          pair.add(mapToPriceIndentifiedByDayModel(dayId, price));
        }
      }
    }

    return tickets;
  }

  mapToPriceIndentifiedByDayModel(int dayId, PriceModel price) {
    return PriceIndentifiedByDayModel(
      id: price.id,
      price: price.price,
      ticket: price.ticket,
      priceDayId: dayId,
    );
  }
}
