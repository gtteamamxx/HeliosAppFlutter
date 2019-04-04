import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/other/helpers/constants.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/redux/app/app_state.dart';
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
        final double width = MediaQuery.of(context).size.width;
        return Material(
          color: HeliosColors.backgroundTertiary,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ConstrainedBox(
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
                    Positioned(
                      left: 160,
                      top: 210,
                      child: Container(
                        width: width - 160,
                        padding: EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              viewModel.repertoire.title,
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: "Poppins",
                                height: 0.7,
                              ),
                            ),
                            Text(
                              "Premiera: ${DateFormat("dd.MM.yyyy").format(viewModel.repertoire.releaseDate)}",
                              style: TextStyle(
                                color: HeliosColors.categoryFontColor,
                                fontSize: 16,
                                fontFamily: "Poppins",
                                height: 0.8,
                              ),
                            ),
                            Text(
                              "Od lat: ${viewModel.repertoire.minYear} / Produkcja: ${viewModel.repertoire.productionCountries.join(", ")} [${viewModel.repertoire.productionYear}]",
                              style: TextStyle(
                                fontSize: 16,
                                color: HeliosColors.categoryFontColor,
                                fontFamily: "Poppins",
                                height: 0.7,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              viewModel.repertoire.category,
                              style: TextStyle(
                                fontSize: 16,
                                color: HeliosColors.categoryFontColor,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Opis filmu",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      viewModel.repertoire.description,
                      style: TextStyle(
                          fontFamily: "Poppins", fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Reżyseria",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      viewModel.repertoire.directors.join(", "),
                      style: TextStyle(
                          fontFamily: "Poppins", fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Scenariusz",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      viewModel.repertoire.screenWriters.join(", "),
                      style: TextStyle(
                          fontFamily: "Poppins", fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Obsada",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      viewModel.repertoire.actors.join(", "),
                      style: TextStyle(
                          fontFamily: "Poppins", fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Galeria zdjęć",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
              ),
            ],
          ),
        );
      },
    );
  }
}
