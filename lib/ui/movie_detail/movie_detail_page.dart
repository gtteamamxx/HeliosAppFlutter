import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/other/helpers/constants.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/ui/common/helios_text.dart';
import 'package:helios_app/ui/common/movie_header_hero.dart';
import 'package:helios_app/ui/common/movie_hero.dart';
import 'package:helios_app/viewmodels/movie_detail/movie_detail_page_view_model.dart';
import 'package:intl/intl.dart';

class MovieDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MovieDetailPageViewModel>(
      converter: (store) => MovieDetailPageViewModel.fromStore(store),
      builder: (context, viewModel) {
        return Material(
          color: HeliosColors.backgroundTertiary,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _buildHeader(context, viewModel),
              _buildContent(viewModel),
              _buildGallery(viewModel),
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
      return Container();
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
                      child: Image.network(
                        viewModel.repertoire.videoImageUrl,
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          viewModel.isLoading
              ? Container()
              : Positioned(
                  top: 0,
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
                  : MovieHero(
                      id: viewModel.repertoire.id,
                      child: FadeInImage.assetNetwork(
                        image: viewModel.repertoire.imageUrl,
                        placeholder: Constants.shimmerPath,
                        fit: BoxFit.fill,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: FadeInImage.assetNetwork(
                image: viewModel.repertoire.galleryUrls[item],
                placeholder: Constants.shimmerPath,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
