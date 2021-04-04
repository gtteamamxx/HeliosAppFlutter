import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app_flutter_x/other/helpers/constants.dart';
import 'package:helios_app_flutter_x/other/helpers/helios_colors.dart';
import 'package:helios_app_flutter_x/redux/app/app_state.dart';
import 'package:helios_app_flutter_x/ui/common/error_button.dart';
import 'package:helios_app_flutter_x/ui/common/headered_widget.dart';
import 'package:helios_app_flutter_x/ui/common/helios_text.dart';
import 'package:helios_app_flutter_x/ui/common/movie_category.dart';
import 'package:helios_app_flutter_x/ui/common/movie_header_hero.dart';
import 'package:helios_app_flutter_x/ui/common/movie_hero.dart';
import 'package:helios_app_flutter_x/viewmodels/movie_detail/movie_detail_page_view_model.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailPage extends StatefulWidget {
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
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
    if (viewModel.isLoadingMovieRepertoire) {
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
          _buildContentSection("Opis filmu", viewModel.movieRepertoire.movie.description),
          _buildContentSection("Reżyseria", viewModel.movieRepertoire.movie.directors.map((x) => x.name).join(", ")),
          _buildContentSection("Scenariusz", viewModel.movieRepertoire.movie.screenWriters.map((x) => x.name).join(", ")),
          _buildContentSection("Obsada", viewModel.movieRepertoire.movie.actors.map((x) => x.name).join(", ")),
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
        clipBehavior: Clip.hardEdge,
        fit: StackFit.loose,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: width,
              height: 200,
              color: HeliosColors.backgroundPrimary,
              child: viewModel.isLoadingMovieRepertoire
                  ? Center(child: CircularProgressIndicator())
                  : MovieHeaderHero(
                      id: viewModel.movieRepertoire.movie.id,
                      child: GestureDetector(
                        onTap: () async {
                          String url = viewModel.movieRepertoire.movie.trailerUrl;
                          if (await canLaunch(url)) {
                            launch(url);
                          }
                        },
                        child: Stack(
                          children: [
                            Image.network(
                              viewModel.movieRepertoire.movie.videoImage.url,
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
          viewModel.isLoadingMovieRepertoire
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
              child: viewModel.isLoadingMovieRepertoire
                  ? Image.asset(
                      Constants.shimmerPath,
                      fit: BoxFit.fill,
                    )
                  : GestureDetector(
                      onTap: () => viewModel.onImageTap(viewModel.movieRepertoire.movie.image.url),
                      child: MovieHero(
                        id: viewModel.movieRepertoire.movie.id,
                        child: FadeInImage.assetNetwork(
                          image: viewModel.movieRepertoire.movie.image.url,
                          placeholder: Constants.shimmerPath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
            ),
          ),
          viewModel.isLoadingMovieRepertoire
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
                          viewModel.movieRepertoire.movie.title,
                          fontSize: 22,
                          height: 0.7,
                        ),
                        HeliosText(
                          "Premiera: ${DateFormat("dd.MM.yyyy").format(viewModel.movieRepertoire.movie.releaseDate)}",
                          color: HeliosColors.categoryFontColor,
                          fontSize: 14,
                          height: 0.8,
                        ),
                        HeliosText(
                          "Od lat: ${viewModel.movieRepertoire.movie.minYear}" +
                              "/ Produkcja: ${viewModel.movieRepertoire.movie.productionCountries.map((x) => x.name).join(", ")}" +
                              " [${viewModel.movieRepertoire.movie.productionYear}]",
                          fontSize: 14,
                          color: HeliosColors.categoryFontColor,
                          height: 0.7,
                        ),
                        SizedBox(height: 10),
                        MovieCategory(
                          categories: viewModel.movieRepertoire.movie.categories,
                          fontSize: 16,
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
    if (viewModel.isLoadingMovieRepertoire) {
      return Container();
    }

    return Container(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.movieRepertoire.movie.images.length,
        itemBuilder: (context, item) {
          return Container(
            width: 250,
            margin: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () => viewModel.onImageTap(viewModel.movieRepertoire.movie.images[item].url),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: FadeInImage.assetNetwork(
                  image: viewModel.movieRepertoire.movie.images[item].url,
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
      headerPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0).copyWith(top: 5),
      child: (() {
        if (viewModel.isLoadingMovieRepertoire) {
          return _buildLoadingMovieRepertoire();
        } else if (viewModel.isErrorMovieRepertoire) {
          return _buildErrorMovieRepertoire(viewModel);
        }
        return Container();
        // return _buildMovieRepertoire(viewModel);
      })(),
    );
  }

  _buildErrorMovieRepertoire(MovieDetailPageViewModel viewModel) {
    return Container(
      height: 200,
      child: ErrorButton(title: "Wystąpił problem podczas wczytywania repertuaru", refreshClick: () => viewModel.onRefreshMovieRepertoireTap()),
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

  // _buildMovieRepertoire(MovieDetailPageViewModel viewModel) {
  //   return Container(
  //     padding: EdgeInsets.only(bottom: 20),
  //     child: Column(
  //       children: <Widget>[
  //         HeliosCinemaName(
  //           cinemaName: viewModel.selectedCinemaName,
  //           padding: EdgeInsets.only(left: 10),
  //         ),
  //         RepertoireDays(
  //           repertoire: viewModel.movieRepertoire.map((x) {
  //             return RepertoireDateModel(date: x.date);
  //           }).toList(),
  //           itemBackgroundColor: HeliosColors.backgroundSixth,
  //           itemFontColor: Colors.white.withAlpha(180),
  //           onSelectedDayChanged: (index) {
  //             if (_selectedMovieRepertoireIndex == index) {
  //               return;
  //             }

  //             setState(() {
  //               _selectedMovieRepertoireIndex = index;
  //               _selectedPlayHourIndex = 0;
  //               WidgetsBinding.instance.addPostFrameCallback((_) {
  //                 _scrollController.animateTo(
  //                     _scrollController.position.maxScrollExtent,
  //                     duration: Duration(seconds: 1),
  //                     curve: Curves.easeIn);
  //               });
  //             });
  //           },
  //         ),
  //         SizedBox(height: 10),
  //         Container(
  //           padding: EdgeInsets.symmetric(horizontal: 5),
  //           child: Wrap(
  //             direction: Axis.horizontal,
  //             alignment: WrapAlignment.center,
  //             spacing: 10,
  //             children: viewModel
  //                 .movieRepertoire[_selectedMovieRepertoireIndex].playHours
  //                 .map((playHour) {
  //               int index = viewModel
  //                   .movieRepertoire[_selectedMovieRepertoireIndex].playHours
  //                   .indexOf(playHour);
  //               return Container(
  //                 width: 80,
  //                 height: 60,
  //                 child: HeliosSelectionButton(
  //                   backgroundColor: HeliosColors.backgroundSixth,
  //                   staticBackgroundColor: true,
  //                   isSelected: _selectedPlayHourIndex == index,
  //                   child: HeliosText(DateFormat("HH:mm").format(playHour)),
  //                   onTap: () {
  //                     setState(() {
  //                       _selectedPlayHourIndex = index;
  //                     });
  //                   },
  //                 ),
  //               );
  //             }).toList(),
  //           ),
  //         ),
  //         SizedBox(height: 10),
  //         Center(
  //           child: HeliosButton(
  //             onTap: () => viewModel.onSelectMovieRepertoireTap(
  //                   viewModel.movieRepertoire[_selectedMovieRepertoireIndex],
  //                   _selectedPlayHourIndex,
  //                 ),
  //             content: "Wybierz",
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
