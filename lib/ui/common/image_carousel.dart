import 'package:flutter/material.dart';
import 'package:helios_app_flutter_x/models/category/category_model.dart';
import 'package:helios_app_flutter_x/models/featured_movies/featured_movie_model.dart';
import 'package:helios_app_flutter_x/other/helpers/constants.dart';
import 'package:helios_app_flutter_x/other/helpers/helios_colors.dart';
import 'package:helios_app_flutter_x/ui/common/error_button.dart';
import 'package:helios_app_flutter_x/ui/common/helios_text.dart';
import 'package:helios_app_flutter_x/ui/common/movie_header_hero.dart';

import 'package:url_launcher/url_launcher.dart';

typedef FeaturedMovieTap = void Function(FeaturedMovieModel featuredMovie);

class ImageCarousel extends StatefulWidget {
  ImageCarousel({
    @required this.children,
    @required this.height,
    @required this.isLoading,
    @required this.isError,
    @required this.refreshClick,
    @required this.onTap,
  });

  final List<FeaturedMovieModel> children;
  final double height;
  final bool isLoading;
  final bool isError;
  final VoidCallback refreshClick;
  final FeaturedMovieTap onTap;

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController(initialPage: 0);
  int actualPageIndex = 0;

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Stack(
        children: [
          AnimatedSwitcher(
            duration: Constants.fadeInDuration,
            child: widget.isLoading
                ? _buildLoading(context)
                : widget.isError
                    ? _buildError()
                    : _buildImageCarousel(),
          ),
          _buildPageDots(),
          widget.isLoading || widget.isError ? Container() : _buildShowTrailer(),
        ],
      ),
    );
  }

  _buildError() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ErrorButton(
        title: "Nie udało się wczytać obrazków :(",
        refreshClick: widget.refreshClick,
      ),
    );
  }

  _buildImageCarousel() {
    return PageView.builder(
      itemCount: widget.children.length,
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      onPageChanged: (index) {
        setState(() {
          actualPageIndex = index;
        });
      },
      itemBuilder: (context, index) {
        FeaturedMovieModel featuredMovie = widget.children[index];
        return GestureDetector(
          onTap: () => widget.onTap(featuredMovie),
          child: Stack(
            children: [
              Container(
                height: widget.height,
                child: MovieHeaderHero(
                  id: featuredMovie.movie.id,
                  child: Image.network(
                    featuredMovie.movie.videoImage.url,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.0, 0.5],
                    colors: [Colors.black54, Colors.transparent],
                  ),
                ),
              ),
              _buildTitle(featuredMovie.movie.title),
              _buildCategories(featuredMovie.movie.categories),
            ],
          ),
        );
      },
    );
  }

  _buildLoading(BuildContext context) {
    return Container(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      color: HeliosColors.backgroundSecondary,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  _buildTitle(String title) {
    return Positioned(
      bottom: 50,
      left: 10,
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        child: HeliosText(
          title,
          overflow: TextOverflow.ellipsis,
          fontSize: 45,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }

  _buildCategories(List<CategoryModel> categories) {
    return Positioned(
      bottom: 35,
      left: 20,
      child: HeliosText(
        categories.map((x) => x.name).join(", "),
        fontSize: 12,
        fontWeight: FontWeight.w100,
      ),
    );
  }

  _buildShowTrailer() {
    return Positioned(
      bottom: 10,
      right: 10,
      child: InkWell(
        child: HeliosText(
          "Zobacz zwiastun",
          fontSize: 13,
          textDecoration: TextDecoration.underline,
        ),
        onTap: () async {
          String url = _getTrailerUrlByIndex(actualPageIndex);
          if (await canLaunch(url)) {
            launch(url);
          }
        },
      ),
    );
  }

  _buildPageDots() {
    const double size = 8;
    int length = widget.children.length == 0 || widget.isError ? 1 : widget.children.length;

    return Positioned(
      bottom: 13,
      left: MediaQuery.of(context).size.width / 2 - length * size,
      child: Container(
        height: size,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                border: Border.all(
                  width: 1,
                  color: Colors.white.withAlpha(100),
                ),
                color: actualPageIndex == index ? Colors.white : Colors.transparent,
              ),
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: InkWell(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  String _getTrailerUrlByIndex(int index) {
    return widget.children[index].movie.trailerUrl;
  }
}
