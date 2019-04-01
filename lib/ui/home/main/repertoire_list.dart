import 'package:flutter/material.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';
import 'package:helios_app/other/helpers/colors_helper.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:intl/intl.dart';

typedef TimeOfTheDayChange = Function(TimeOfTheDayEnum timeOfTheDay);

class RepertoireList extends StatelessWidget {
  RepertoireList({
    this.repertoire,
    this.isLoading,
    this.onTimeOfTheDayChange,
    this.selectedTimeOfTheDay,
    this.maximumItemsPerSection = 3,
    this.maximumSectionsNumber = 2,
    this.sectionHeight = 350,
    this.sectionItemWidth = 150,
    this.infoSectionHeight = 100,
  });

  final List<RepertoireModel> repertoire;
  final bool isLoading;
  final TimeOfTheDayChange onTimeOfTheDayChange;
  final TimeOfTheDayEnum selectedTimeOfTheDay;

  final int maximumItemsPerSection;
  final int maximumSectionsNumber;

  final double sectionHeight;
  final double sectionItemWidth;
  final double infoSectionHeight;
  final EdgeInsets padding = EdgeInsets.symmetric(horizontal: 10);
  final double itemHoursFontSize = 14;
  final double itemTitleFontSize = 14;
  final double itemCategoryFontSize = 13;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle(),
          _buildButtons(),
          _buildContent(),
        ],
      ),
    );
  }

  _buildContent() {
    if (this.isLoading) {
      return _buildLoading();
    }

    if (this.repertoire.isEmpty) {
      return _buildNoItems();
    }

    return _buildSections();
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
    return Container(
      height: this.sectionHeight,
      padding: padding.copyWith(top: 20, bottom: 20),
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
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        FadeInImage.assetNetwork(
                          image: repertoireItem.imageUrl,
                          placeholder: 'assets/shimmer_image.gif',
                          fit: BoxFit.fill,
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
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                Container(
                  height: 20,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: repertoireItem.playHours.length,
                    itemBuilder: (context, item) {
                      DateTime playHour = repertoireItem.playHours[item];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          DateFormat("HH:mm").format(playHour),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: "Poppins",
                            fontSize: itemHoursFontSize,
                          ),
                        ),
                      );
                    },
                  ),
                )
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
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                color: isSelected
                    ? HeliosColors.backgroundFourth
                    : Colors.transparent,
              )
            : null,
        child: InkWell(
          onTap: () {
            this.onTimeOfTheDayChange(timeOfTheDay);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w100,
                ),
              ),
            ),
          ),
        ),
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
}
