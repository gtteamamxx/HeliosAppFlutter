import 'package:flutter/material.dart';
import 'package:helios_app/models/repertoire/movie_repertoire.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';
import 'package:helios_app/other/helpers/colors_helper.dart';
import 'package:helios_app/other/helpers/constants.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/ui/common/error_button.dart';
import 'package:helios_app/ui/common/helios_selection_button.dart';
import 'package:helios_app/ui/common/helios_text.dart';
import 'package:helios_app/ui/common/movie_category.dart';
import 'package:helios_app/ui/common/movie_hero.dart';
import 'package:helios_app/ui/common/play_hours_builder.dart';

typedef TimeOfTheDayChange = Function(TimeOfTheDayEnum timeOfTheDay);
typedef MovieRepertoireTap = Function(MovieRepertoireModel movieRepertoire);

class MovieRepertoireList extends StatelessWidget {
  MovieRepertoireList({
    this.movieRepertoires,
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
    this.movieRepertoireClick,
  });

  final List<MovieRepertoireModel> movieRepertoires;
  final bool isLoading;
  final bool isError;
  final VoidCallback refreshClick;
  final TimeOfTheDayChange timeOfTheDayChange;
  final TimeOfTheDayEnum selectedTimeOfTheDay;
  final MovieRepertoireTap movieRepertoireClick;

  final int maximumItemsPerSection;
  final int maximumSectionsNumber;

  final double sectionHeight;
  final double sectionItemWidth;
  final double infoSectionHeight;
  final EdgeInsets padding = EdgeInsets.symmetric(horizontal: 10);

  final double itemHoursFontSize = 15;
  final double itemTitleFontSize = 15;
  final double itemCategoryFontSize = 14;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
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

    if (this.movieRepertoires.isEmpty) {
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
      int indexTo = offsetIndex + this.maximumItemsPerSection >
              this.movieRepertoires.length
          ? this.movieRepertoires.length
          : offsetIndex + this.maximumItemsPerSection;

      List<MovieRepertoireModel> moviesForSection =
          this.movieRepertoires.getRange(offsetIndex, indexTo).toList();

      offsetIndex = indexTo;
      bool isLastSection = offsetIndex == this.movieRepertoires.length;

      sections.add(
        _buildMoviesSection(
          moviesForSection,
          isLastSection
              ? HeliosColors.backgroundTertiary
              : (i + 1) % 2 == 0
                  ? HeliosColors.backgroundTertiary
                  : HeliosColors.backgroundFourth,
        ),
      );

      if (isLastSection) {
        break;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: sections,
    );
  }

  _buildNoItems() {
    return Container(
      height: this.infoSectionHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeliosText("Niestety, ale nie mamy filmów o tej porze dnia"),
            HeliosText("Spróbuj wybrać inną")
          ],
        ),
      ),
    );
  }

  _buildMoviesSection(
      List<MovieRepertoireModel> movieRepertoires, Color backgroundColor) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: this.sectionHeight),
      child: Container(
        padding: EdgeInsets.only(top: 20, bottom: 10),
        color: backgroundColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: movieRepertoires.map((movieRepertoire) {
                return Container(
                  width: this.sectionItemWidth,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => this.movieRepertoireClick(movieRepertoire),
                        child: Container(
                          height: 225,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                MovieHero(
                                  id: movieRepertoire.id,
                                  child: FadeInImage.assetNetwork(
                                    image: movieRepertoire.movie.image.url,
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
                                      colors: [
                                        Colors.black54,
                                        Colors.transparent
                                      ],
                                    ),
                                  ),
                                ),
                                movieRepertoire.movie.label != null
                                    ? Positioned(
                                        top: 7,
                                        left: 7,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Color(
                                              getColorHexFromStr(movieRepertoire
                                                  .movie.labelHex),
                                            ),
                                          ),
                                          child: HeliosText(
                                            movieRepertoire.movie.label,
                                            fontWeight: FontWeight.w100,
                                            fontSize: 11,
                                            height: null,
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 8),
                            HeliosText(
                              movieRepertoire.movie.title,
                              fontSize: itemTitleFontSize,
                              height: 0.7,
                            ),
                            MovieCategory(
                              categories: movieRepertoire.movie.categories,
                              fontSize: itemCategoryFontSize,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: RichText(
                                softWrap: true,
                                text: TextSpan(
                                  children: buildPlayHours(
                                    movieRepertoire.playHours,
                                    fontSize: itemHoursFontSize,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
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
          HeliosText(
            "Repertuar",
            fontSize: 22,
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
          HeliosText(
            "Środa 23.01",
            fontSize: 15,
            fontWeight: FontWeight.w100,
          ),
        ],
      ),
    );
  }
}
