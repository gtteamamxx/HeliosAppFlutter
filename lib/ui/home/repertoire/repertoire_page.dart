import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app_flutter_x/models/repertoire/movie_repertoire.dart';
import 'package:helios_app_flutter_x/models/repertoire/repertoire_model.dart';
import 'package:helios_app_flutter_x/other/helpers/colors_helper.dart';
import 'package:helios_app_flutter_x/other/helpers/constants.dart';
import 'package:helios_app_flutter_x/other/helpers/helios_colors.dart';
import 'package:helios_app_flutter_x/redux/actions/home/repertoire/fetch_repertoire_action.dart';
import 'package:helios_app_flutter_x/redux/app/app_state.dart';
import 'package:helios_app_flutter_x/ui/common/error_button.dart';
import 'package:helios_app_flutter_x/ui/common/helios_text.dart';
import 'package:helios_app_flutter_x/ui/common/movie_category.dart';
import 'package:helios_app_flutter_x/ui/common/movie_hero.dart';
import 'package:helios_app_flutter_x/ui/common/play_hours_builder.dart';
import 'package:helios_app_flutter_x/ui/common/repertoire_days.dart';
import 'package:helios_app_flutter_x/viewmodels/home/repertoire/repertoire_page_view_model.dart';

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
    return RepertoireDays(
      repertoire: viewModel.repertoire,
      onSelectedDayChanged: (index) {
        setState(() => _selectedDayIndex = index);
      },
    );
  }

  _buildRepertoireForDay(RepertoirePageViewModel viewModel) {
    RepertoireModel repertoire = viewModel.repertoire[_selectedDayIndex];

    List<Widget> widgets = [];

    for (MovieRepertoireModel movieRepertoire in repertoire.movies) {
      widgets.add(
        GestureDetector(
          onTap: () => viewModel.onMovieRepertoireTap(movieRepertoire),
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
                          id: movieRepertoire.movie.id,
                          child: FadeInImage.assetNetwork(
                            image: movieRepertoire.movie.image.url,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: HeliosText(
                                    movieRepertoire.movie.title,
                                    height: 0.7,
                                    fontSize: 16,
                                  ),
                                ),
                                movieRepertoire.movie.label != null
                                    ? Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: Color(
                                            getColorHexFromStr(movieRepertoire.movie.labelHex),
                                          ),
                                        ),
                                        child: HeliosText(
                                          movieRepertoire.movie.label,
                                          fontWeight: FontWeight.w100,
                                          fontSize: 11,
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                            MovieCategory(
                              categories: movieRepertoire.movie.categories,
                              fontSize: 14,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: "Od lat: ${movieRepertoire.movie.minYear}"),
                                  TextSpan(
                                    text: ", Czas trwania: ${movieRepertoire.movie.duration.inMinutes} min.",
                                  ),
                                ],
                                style: TextStyle(
                                  fontFamily: Constants.fontName,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            HeliosText(
                              "Produkcja: ${movieRepertoire.movie.productionCountries.map((x) => x.name).join(", ")} [${movieRepertoire.movie.productionYear}]",
                              fontSize: 13,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      children: buildPlayHours(
                                        movieRepertoire.playHours,
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
}
