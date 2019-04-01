import 'package:flutter/material.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';
import 'package:helios_app/other/helpers/colors_helper.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:intl/intl.dart';

typedef TimeOfTheDayChange = Function(TimeOfTheDayEnum timeOfTheDay);

class RepertoireList extends StatelessWidget {
  RepertoireList({
    this.height,
    this.repertoire,
    this.isLoading,
    this.onTimeOfTheDayChange,
    this.selectedTimeOfTheDay,
  });

  final double height;
  final List<RepertoireModel> repertoire;
  final bool isLoading;
  final TimeOfTheDayChange onTimeOfTheDayChange;
  final TimeOfTheDayEnum selectedTimeOfTheDay;

  final EdgeInsets padding = EdgeInsets.symmetric(horizontal: 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle(),
          _buildButtons(),
          _buildRepertoireSection(
            repertoire.take((repertoire.length / 2).round()).toList(),
            HeliosColors.backgroundFourth,
          ),
          _buildRepertoireSection(
            repertoire.skip((repertoire.length / 2).round()).toList(),
            HeliosColors.backgroundPrimary,
          ),
        ],
      ),
    );
  }

  _buildRepertoireSection(
      List<RepertoireModel> repertoire, Color backgroundColor) {
    return Expanded(
      child: Container(
        color: backgroundColor,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: padding.copyWith(top: 30, bottom: 30),
                itemCount: repertoire.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  RepertoireModel repertoireItem = repertoire[index];
                  List<DateTime> playHours =
                      _getPlayHoursForRepertoireItem(repertoireItem);
                  return Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 75,
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
                                      colors: [
                                        Colors.black54,
                                        Colors.transparent
                                      ],
                                    ),
                                  ),
                                ),
                                repertoireItem.label != null
                                    ? Positioned(
                                        top: 10,
                                        left: 10,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                                              fontSize: 17,
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
                          flex: 19,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(height: 8),
                              Text(
                                repertoireItem.title,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 17,
                                  height: 0.8,
                                ),
                              ),
                              Text(
                                repertoireItem.category,
                                style: TextStyle(
                                  color: HeliosColors.categoryFontColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            scrollDirection: Axis.horizontal,
                            itemCount: playHours.length,
                            itemBuilder: (context, item) {
                              DateTime playHour = playHours[item];
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  DateFormat("HH:mm").format(playHour),
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontFamily: "Poppins",
                                    fontSize: 21,
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
    bool isSelected = timeOfTheDay == selectedTimeOfTheDay;

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
                  fontSize: 17,
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
        children: [
          Text(
            "Repertuar",
            style: TextStyle(fontFamily: "Poppins", fontSize: 24),
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
              fontSize: 17,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }

  List<DateTime> _getPlayHoursForRepertoireItem(
      RepertoireModel repertoireItem) {
    if (this.selectedTimeOfTheDay == TimeOfTheDayEnum.UntilNoon) {
      return repertoireItem.playHours.where((x) => x.hour < 12).toList();
    } else if (this.selectedTimeOfTheDay == TimeOfTheDayEnum.InTheAfterNoon) {
      return repertoireItem.playHours
          .where((x) => x.hour >= 12 && x.hour < 18)
          .toList();
    } else {
      return repertoireItem.playHours.where((x) => x.hour >= 18).toList();
    }
  }
}
