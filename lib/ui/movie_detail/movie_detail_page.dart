import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/models/repertoire/repertoire_date_model.dart';
import 'package:helios_app/other/helpers/constants.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/ui/common/error_button.dart';
import 'package:helios_app/ui/common/headered_widget.dart';
import 'package:helios_app/ui/common/helios_button.dart';
import 'package:helios_app/ui/common/helios_cinema_name.dart';
import 'package:helios_app/ui/common/helios_selection_button.dart';
import 'package:helios_app/ui/common/helios_text.dart';
import 'package:helios_app/ui/common/movie_header_hero.dart';
import 'package:helios_app/ui/common/movie_hero.dart';
import 'package:helios_app/ui/common/repertoire_days.dart';
import 'package:helios_app/viewmodels/movie_detail/movie_detail_page_view_model.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailPage extends StatefulWidget {
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  int _selectedMovieRepertoireIndex = 0;
  int _selectedPlayHourIndex = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MovieDetailPageViewModel>(
      converter: (store) => MovieDetailPageViewModel.fromStore(store),
      builder: (context, viewModel) {
        return Material(
          color: HeliosColors.backgroundTertiary,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.zero,
            children: [
              _buildHeader(context, viewModel),
              _buildContent(viewModel),
              _buildGallery(viewModel),
              _buildRepertoire(viewModel),
            ],
          ),
        );
      },
    );
  }

  _buildContentSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeliosText(
          title,
          fontSize: 20,
        ),
        HeliosText(
          content,
          fontWeight: FontWeight.w300,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  _buildContent(MovieDetailPageViewModel viewModel) {
    if (viewModel.isLoading) {
      return Container(
        height: 500,
      );
    }

    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContentSection("Opis filmu", viewModel.repertoire.description),
          _buildContentSection(
              "Reżyseria", viewModel.repertoire.directors.join(", ")),
          _buildContentSection(
              "Scenariusz", viewModel.repertoire.screenWriters.join(", ")),
          _buildContentSection(
              "Obsada", viewModel.repertoire.actors.join(", ")),
          SizedBox(height: 10),
          HeliosText(
            "Galeria zdjęć",
            fontSize: 20,
          ),
        ],
      ),
    );
  }

  _buildHeader(BuildContext context, MovieDetailPageViewModel viewModel) {
    final width = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: BoxConstraints.loose(Size.fromHeight(350)),
      child: Stack(
        overflow: Overflow.visible,
        fit: StackFit.loose,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: width,
              height: 200,
              color: HeliosColors.backgroundPrimary,
              child: viewModel.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : MovieHeaderHero(
                      id: viewModel.repertoire.id,
                      child: GestureDetector(
                        onTap: () async {
                          String url = viewModel.repertoire.trailerUrl;
                          if (await canLaunch(url)) {
                            launch(url);
                          }
                        },
                        child: Stack(
                          children: [
                            Image.network(
                              viewModel.repertoire.videoImageUrl,
                              fit: BoxFit.cover,
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Positioned.fill(
                              child: Image.asset(
                                Constants.playIconPath,
                                color: Colors.white.withAlpha(180),
                                scale: 2,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          ),
          viewModel.isLoading
              ? Container()
              : Positioned(
                  top: 0,
                  child: IgnorePointer(
                    child: Container(
                      height: 200,
                      width: width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.0, 0.5],
                          colors: [Colors.black54, Colors.transparent],
                        ),
                      ),
                    ),
                  ),
                ),
          Positioned(
            bottom: 0,
            left: 15,
            child: Container(
              width: 130,
              height: 190,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset.fromDirection(0, 0),
                    spreadRadius: 1,
                  )
                ],
              ),
              child: viewModel.isLoading
                  ? Image.asset(
                      Constants.shimmerPath,
                      fit: BoxFit.fill,
                    )
                  : GestureDetector(
                      onTap: () =>
                          viewModel.onImageTap(viewModel.repertoire.imageUrl),
                      child: MovieHero(
                        id: viewModel.repertoire.id,
                        child: FadeInImage.assetNetwork(
                          image: viewModel.repertoire.imageUrl,
                          placeholder: Constants.shimmerPath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
            ),
          ),
          viewModel.isLoading
              ? Container()
              : Positioned(
                  left: 160,
                  top: 210,
                  child: Container(
                    width: width - 160,
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        HeliosText(
                          viewModel.repertoire.title,
                          fontSize: 22,
                          height: 0.7,
                        ),
                        HeliosText(
                          "Premiera: ${DateFormat("dd.MM.yyyy").format(viewModel.repertoire.releaseDate)}",
                          color: HeliosColors.categoryFontColor,
                          fontSize: 14,
                          height: 0.8,
                        ),
                        HeliosText(
                          "Od lat: ${viewModel.repertoire.minYear} / Produkcja: ${viewModel.repertoire.productionCountries.join(", ")} [${viewModel.repertoire.productionYear}]",
                          fontSize: 14,
                          color: HeliosColors.categoryFontColor,
                          height: 0.7,
                        ),
                        SizedBox(height: 10),
                        HeliosText(
                          viewModel.repertoire.category,
                          fontSize: 16,
                          color: HeliosColors.categoryFontColor,
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  _buildGallery(MovieDetailPageViewModel viewModel) {
    if (viewModel.isLoading) {
      return Container();
    }

    return Container(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.repertoire.galleryUrls.length,
        itemBuilder: (context, item) {
          return Container(
            width: 250,
            margin: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () =>
                  viewModel.onImageTap(viewModel.repertoire.galleryUrls[item]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: FadeInImage.assetNetwork(
                  image: viewModel.repertoire.galleryUrls[item],
                  placeholder: Constants.shimmerPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _buildRepertoire(MovieDetailPageViewModel viewModel) {
    return HeaderedWidget(
      backgroundColor: HeliosColors.backgroundFourth,
      additionalChild: Container(),
      title: "Wybierz datę",
      headerFontSize: 20,
      headerPadding:
          EdgeInsets.symmetric(horizontal: 10, vertical: 0).copyWith(top: 5),
      child: (() {
        if (viewModel.isLoadingMovieRepertoire) {
          return _buildLoadingMovieRepertoire();
        } else if (viewModel.isErrorMovieRepertoire) {
          return _buildErrorMovieRepertoire(viewModel);
        }

        return _buildMovieRepertoire(viewModel);
      })(),
    );
  }

  _buildErrorMovieRepertoire(MovieDetailPageViewModel viewModel) {
    return Container(
      height: 200,
      child: ErrorButton(
          title: "Wystąpił problem podczas wczytywania repertuaru",
          refreshClick: () => viewModel.onRefreshMovieRepertoireTap()),
    );
  }

  _buildLoadingMovieRepertoire() {
    return Container(
      height: 200,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  _buildMovieRepertoire(MovieDetailPageViewModel viewModel) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          HeliosCinemaName(
            cinemaName: viewModel.selectedCinemaName,
            padding: EdgeInsets.only(left: 10),
          ),
          RepertoireDays(
            repertoireDays: viewModel.movieRepertoire.map((x) {
              return RepertoireDateModel(date: x.date);
            }).toList(),
            itemBackgroundColor: HeliosColors.backgroundSixth,
            itemFontColor: Colors.white.withAlpha(180),
            onSelectedDayChanged: (index) {
              if (_selectedMovieRepertoireIndex == index) {
                return;
              }

              setState(() {
                _selectedMovieRepertoireIndex = index;
                _selectedPlayHourIndex = 0;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeIn);
                });
              });
            },
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              spacing: 10,
              children: viewModel
                  .movieRepertoire[_selectedMovieRepertoireIndex].playHours
                  .map((playHour) {
                int index = viewModel
                    .movieRepertoire[_selectedMovieRepertoireIndex].playHours
                    .indexOf(playHour);
                return Container(
                  width: 80,
                  height: 60,
                  child: HeliosSelectionButton(
                    backgroundColor: HeliosColors.backgroundSixth,
                    staticBackgroundColor: true,
                    isSelected: _selectedPlayHourIndex == index,
                    child: HeliosText(DateFormat("HH:mm").format(playHour)),
                    onTap: () {
                      setState(() {
                        _selectedPlayHourIndex = index;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: HeliosButton(
              onTap: () {},
              content: "Wybierz",
            ),
          ),
        ],
      ),
    );
  }
}
