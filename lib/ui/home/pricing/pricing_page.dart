import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/models/pricing/pricing_model.dart';
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
  Animation<double> _changeOpacityAnimation;
  Animation<Color> _changeColorAnimation;
  Animation<Color> _changeColorBackAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 700,
        ))
      ..addListener(() {
        setState(() {});
      });

    _changeColorAnimation = ColorTween(
            begin: Colors.white, end: HeliosColors.pricingPagePricingTypeColor)
        .animate(_animationController);

    _changeColorBackAnimation = ColorTween(
            begin: HeliosColors.pricingPagePricingTypeColor, end: Colors.white)
        .animate(_animationController);

    _changeOpacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);

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
        if (viewModel.isLoading) {
          return _buildLoading();
        }
        if (viewModel.isError) {
          return _buildError(refreshClick: viewModel.onRefreshClick);
        }

        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: <Widget>[
            _buildPriceTabs(tabs: viewModel.pricing),
          ],
        );
      },
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

  _buildPriceTabs({@required List<PricingModel> tabs}) {
    List<Widget> tabsWidgets = [];

    for (int i = 0; i < tabs.length; ++i) {
      PricingModel pricingModel = tabs[i];

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
                if (_animationController.status == AnimationStatus.completed) {
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
    if (_animationController.status == AnimationStatus.completed) {
      if (index == _selectedPricingIndex) {
        return Colors.white;
      } else {
        return HeliosColors.pricingPagePricingTypeColor;
      }
    } else {
      if (index == _selectedPricingIndex) {
        return _changeColorAnimation.value;
      } else if (index == _lastSelectedIndex) {
        return _changeColorBackAnimation.value;
      } else {
        return HeliosColors.pricingPagePricingTypeColor;
      }
    }
  }
}
