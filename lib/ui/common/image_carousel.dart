import 'package:flutter/material.dart';
import 'package:helios_app/models/featured_movies/featured_movie_model.dart';
import 'package:helios_app/other/helpers/constants.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageCarousel extends StatefulWidget {
  ImageCarousel({
    @required this.children,
    @required this.height,
    @required this.isLoading,
  });

  final List<FeaturedMovieModel> children;
  final double height;
  final bool isLoading;

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
                ? Container(
                    height: widget.height,
                    width: MediaQuery.of(context).size.width,
                    color: HeliosColors.backgroundSecondary,
                    child: Center(child: CircularProgressIndicator()),
                  )
                : PageView.builder(
                    itemCount: widget.children.length,
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        actualPageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      FeaturedMovieModel item = widget.children[index];
                      return Stack(
                        children: [
                          Container(
                            height: widget.height,
                            child: Image.network(
                              item.imageUrl,
                              fit: BoxFit.cover,
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
                          _buildTitle(item.title),
                          _buildCategory(item.category),
                        ],
                      );
                    },
                  ),
          ),
          _buildPageDots(),
          widget.isLoading ? Container() : _buildShowTrailer(),
        ],
      ),
    );
  }

  _buildTitle(String title) {
    return Positioned(
      bottom: 50,
      left: 10,
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 45,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }

  _buildCategory(String category) {
    return Positioned(
      bottom: 35,
      left: 20,
      child: Text(
        category,
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 12,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }

  _buildShowTrailer() {
    return Positioned(
      bottom: 10,
      right: 10,
      child: InkWell(
        child: Text(
          "Zobacz zwiastun",
          style: TextStyle(decoration: TextDecoration.underline),
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
    int length = widget.children.length == 0 ? 1 : widget.children.length;

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
                color: actualPageIndex == index
                    ? Colors.white
                    : Colors.transparent,
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
    return widget.children[index].trailerUrl;
  }
}
