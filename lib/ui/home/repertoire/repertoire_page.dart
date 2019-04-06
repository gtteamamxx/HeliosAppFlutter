import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/models/repertoire/repertoire_date_model.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/other/helpers/colors_helper.dart';
import 'package:helios_app/other/helpers/constants.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/redux/actions/home/repertoire/fetch_repertoire_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/ui/common/error_button.dart';
import 'package:helios_app/ui/common/helios_selection_button.dart';
import 'package:helios_app/ui/common/helios_text.dart';
import 'package:helios_app/ui/common/movie_hero.dart';
import 'package:helios_app/viewmodels/home/repertoire/repertoire_page_view_model.dart';
import 'package:helios_app/ui/common/play_hours_builder.dart';

import 'package:intl/intl.dart';

class RepertoirePage extends StatefulWidget {
  @override
  _RepertoirePageState createState() => _RepertoirePageState();
}

class _RepertoirePageState extends State<RepertoirePage> {
  int _selectedDayIndex = 0;

  final double dateItemHeight = 80;
  final double repertoireItemHeight = 150;
  final double playHourItemFontSize = 15;
  final double imageWidth = 100;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RepertoirePageViewModel>(
      converter: (store) => RepertoirePageViewModel.fromStore(store),
      onInit: (store) {
        store.dispatch(FetchRepertoireAction());
      },
      builder: (context, viewModel) {
        return AnimatedSwitcher(
          duration: Constants.fadeInDuration,
          child: _buildContent(viewModel),
        );
      },
    );
  }

  _buildContent(RepertoirePageViewModel viewModel) {
    if (viewModel.isLoading) {
      return _buildLoading();
    }
    if (viewModel.isError) {
      return ErrorButton(
        title: "Wystapił problem podczas pobierania reperturaru",
        refreshClick: viewModel.onRefreshTap,
      );
    }

    return viewModel.repertoire.isEmpty
        ? Container()
        : ListView(
            padding: EdgeInsets.only(top: 5),
            children: <Widget>[
              _buildRepertoireDays(viewModel),
            ]..addAll(_buildRepertoireForDay(viewModel)),
          );
  }

  _buildRepertoireDays(RepertoirePageViewModel viewModel) {
    return Container(
      height: dateItemHeight,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.repertoire.length,
        itemBuilder: (context, item) {
          RepertoireDateModel repertoire = viewModel.repertoire[item];
          bool isSelected = item == _selectedDayIndex;
          Color fontColor =
              isSelected ? Colors.white : HeliosColors.categoryFontColor;

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: dateItemHeight,
            child: HeliosSelectionButton(
              staticBackgroundColor: true,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  _selectedDayIndex = item;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    HeliosText(
                      _capitalize(
                        DateFormat("EE",
                                Localizations.localeOf(context).languageCode)
                            .format(repertoire.date)
                            .replaceFirst(".", ""),
                      ),
                      color: fontColor,
                    ),
                    HeliosText(
                      DateFormat("dd.MM").format(repertoire.date),
                      color: fontColor,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _buildRepertoireForDay(RepertoirePageViewModel viewModel) {
    RepertoireDateModel repertoire = viewModel.repertoire[_selectedDayIndex];

    List<Widget> widgets = [];

    for (RepertoireModel item in repertoire.repertoire) {
      widgets.add(
        GestureDetector(
          onTap: () => viewModel.onRepertoireTap(item),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: this.repertoireItemHeight),
            child: IntrinsicHeight(
              child: Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: HeliosColors.backgroundFifth,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: MovieHero(
                          id: item.id,
                          child: FadeInImage.assetNetwork(
                            image: item.imageUrl,
                            width: this.imageWidth,
                            placeholder: Constants.shimmerPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: HeliosText(
                                    item.title,
                                    height: 0.7,
                                    fontSize: 16,
                                  ),
                                ),
                                item.label != null
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Color(
                                            getColorHexFromStr(item.labelHex),
                                          ),
                                        ),
                                        child: HeliosText(
                                          item.label,
                                          fontWeight: FontWeight.w100,
                                          fontSize: 11,
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                            HeliosText(
                              item.category,
                              color: HeliosColors.categoryFontColor,
                              fontSize: 14,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: "Od lat: ${item.minYear}"),
                                  TextSpan(
                                    text:
                                        ", Czas trwania: ${item.duration.inMinutes} min.",
                                  ),
                                ],
                                style: TextStyle(
                                  fontFamily: Constants.fontName,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            HeliosText(
                              "Produkcja: ${item.productionCountries.join(", ")} [${item.productionYear}]",
                              fontSize: 13,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      children: buildPlayHours(
                                        item.playHours,
                                        fontSize: playHourItemFontSize,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      );
    }

    return widgets;
  }

  _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  String _capitalize(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}
