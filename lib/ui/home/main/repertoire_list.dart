import 'dart:math';

import 'package:flutter/material.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';
import 'package:helios_app/other/helpers/colors_helper.dart';
import 'package:helios_app/other/helpers/constants.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/ui/common/error_button.dart';
import 'package:helios_app/ui/common/helios_selection_button.dart';
import 'package:helios_app/ui/common/movie_hero.dart';
import 'package:helios_app/ui/common/play_hours_builder.dart';

typedef TimeOfTheDayChange = Function(TimeOfTheDayEnum timeOfTheDay);
typedef RepertoireTap = Function(RepertoireModel repertoire);

class RepertoireList extends StatelessWidget {
  RepertoireList({
    this.repertoire,
    this.isLoading,
    this.isError,
    this.refreshClick,
    this.timeOfTheDayChange,
    this.selectedTimeOfTheDay,
    this.maximumItemsPerSection = 3,
    this.maximumSectionsNumber = 2,
    this.sectionHeight = 350,
    this.sectionItemWidth = 150,
    this.infoSectionHeight = 350,
    this.repertoireClick,
  });

  final List<RepertoireModel> repertoire;
  final bool isLoading;
  final bool isError;
  final VoidCallback refreshClick;
  final TimeOfTheDayChange timeOfTheDayChange;
  final TimeOfTheDayEnum selectedTimeOfTheDay;
  final RepertoireTap repertoireClick;

  final int maximumItemsPerSection;
  final int maximumSectionsNumber;

  final double sectionHeight;
  final double sectionItemWidth;
  final double infoSectionHeight;
  final EdgeInsets padding = EdgeInsets.symmetric(horizontal: 10);

  final double itemHoursFontSize = 15;
  final double itemTitleFontSize = 15;
  final double itemCategoryFontSize = 14;
  final double additionalHeightForExtraPlayHour = 15;

  get playHourMaxRowsInLine {
    const playHourCharNumber = 4;
    int maxRows =
        ((sectionItemWidth / itemHoursFontSize) / playHourCharNumber).ceil();
    return maxRows;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.isError || this.isLoading
          ? EdgeInsets.only(top: 8)
          : EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle(),
          _buildButtons(),
          AnimatedSwitcher(
            duration: Constants.fadeInDuration,
            layoutBuilder: (widget, _) => widget,
            transitionBuilder: (widget, transition) {
              return FadeTransition(
                opacity: this.isLoading
                    ? Tween<double>(begin: 1, end: 1).animate(transition)
                    : transition,
                child: widget,
              );
            },
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  _buildContent() {
    if (this.isLoading) {
      return _buildLoading();
    }

    if (this.isError) {
      return _buildError();
    }

    if (this.repertoire.isEmpty) {
      return _buildNoItems();
    }

    return _buildSections();
  }

  _buildError() {
    return Container(
      height: this.sectionHeight,
      child: ErrorButton(
        title: "Wystąpił problem podczas wczytywania repertuaru",
        refreshClick: this.refreshClick,
      ),
    );
  }

  _buildLoading() {
    return Container(
      height: this.sectionHeight,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  _buildSections() {
    List<Widget> sections = [];

    int offsetIndex = 0;

    for (int i = 0; i < this.maximumSectionsNumber; ++i) {
      int indexTo =
          offsetIndex + this.maximumItemsPerSection > this.repertoire.length
              ? this.repertoire.length
              : offsetIndex + this.maximumItemsPerSection;

      List<RepertoireModel> repertoireForSection =
          this.repertoire.getRange(offsetIndex, indexTo).toList();

      offsetIndex = indexTo;

      sections.add(
        _buildRepertoireSection(
          repertoireForSection,
          (i + 1) % 2 == 0
              ? HeliosColors.backgroundTertiary
              : HeliosColors.backgroundFourth,
        ),
      );

      if (offsetIndex == this.repertoire.length) {
        break;
      }
    }

    return Column(children: sections);
  }

  _buildNoItems() {
    return Container(
      height: this.infoSectionHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Niestety, ale nie mamy filmów o tej porze dnia"),
            Text("Spróbuj wybrać inną")
          ],
        ),
      ),
    );
  }

  _buildRepertoireSection(
      List<RepertoireModel> repertoire, Color backgroundColor) {
    double additionalSectionHeight = _getAddtionalSectionHeight(repertoire);
    return Container(
      height: this.sectionHeight + additionalSectionHeight,
      padding: EdgeInsets.only(top: 20, bottom: 10),
      color: backgroundColor,
      child: ListView.builder(
        itemCount: repertoire.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          RepertoireModel repertoireItem = repertoire[index];
          return Container(
            width: this.sectionItemWidth,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () => this.repertoireClick(repertoireItem),
                  child: Container(
                    height: 225,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          MovieHero(
                            id: repertoireItem.id,
                            child: FadeInImage.assetNetwork(
                              image: repertoireItem.imageUrl,
                              placeholder: Constants.shimmerPath,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 0.3],
                                colors: [Colors.black54, Colors.transparent],
                              ),
                            ),
                          ),
                          repertoireItem.label != null
                              ? Positioned(
                                  top: 7,
                                  left: 7,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color(
                                        getColorHexFromStr(
                                            repertoireItem.labelHex),
                                      ),
                                    ),
                                    child: Text(
                                      repertoireItem.label,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w100,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 8),
                        Text(
                          repertoireItem.title,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: itemTitleFontSize,
                            height: 0.8,
                          ),
                        ),
                        Text(
                          repertoireItem.category,
                          style: TextStyle(
                            color: HeliosColors.categoryFontColor,
                            fontSize: itemCategoryFontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: RichText(
                    text: TextSpan(
                      children: buildPlayHours(
                        repertoireItem.playHours,
                        fontSize: itemHoursFontSize,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildButtons() {
    return Container(
      padding: padding,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildButton("Do południa", TimeOfTheDayEnum.UntilNoon),
          _buildButton("Po południu", TimeOfTheDayEnum.InTheAfterNoon),
          _buildButton("Wieczorem", TimeOfTheDayEnum.InTheEvening),
        ],
      ),
    );
  }

  _buildButton(String title, TimeOfTheDayEnum timeOfTheDay) {
    bool isSelected = timeOfTheDay == this.selectedTimeOfTheDay;

    return Expanded(
      child: HeliosSelectionButton(
        isSelected: isSelected,
        title: title,
        onTap: () => this.timeOfTheDayChange(timeOfTheDay),
      ),
    );
  }

  _buildTitle() {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Repertuar",
            style: TextStyle(fontFamily: "Poppins", fontSize: 22),
          ),
          SizedBox(width: 5),
          Text(
            "|",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w100,
            ),
          ),
          SizedBox(width: 5),
          Text(
            "Środa 23.01",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 15,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }

  double _getAddtionalSectionHeight(List<RepertoireModel> repertoire) {
    if (repertoire.isEmpty) {
      return 0;
    }

    int playHoursMaxNumber =
        repertoire.map((x) => x.playHours.length).reduce(max);

    double additionalHeight =
        (playHoursMaxNumber / this.playHourMaxRowsInLine).ceil() *
            this.additionalHeightForExtraPlayHour;

    return additionalHeight;
  }
}
