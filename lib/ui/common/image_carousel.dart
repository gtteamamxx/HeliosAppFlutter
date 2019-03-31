import 'package:flutter/material.dart';
import 'package:helios_app/ui/common/image_carousel_item.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageCarousel extends StatefulWidget {
  ImageCarousel({
    @required this.children,
    @required this.height,
  });

  final List<ImageCarouselItem> children;
  final double height;

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController(initialPage: 0);
  int get actualPageIndex => mounted ? _pageController.page.round() : 0;

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: widget.children.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                PageView.builder(
                  itemCount: widget.children.length,
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    ImageCarouselItem item = widget.children[index];
                    return Stack(
                      children: [
                        Container(
                          height: widget.height,
                          child: item.image,
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
                _buildPageDots(),
                _buildShowTrailer(),
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
          String url = widget.children[actualPageIndex].trailerUrl;
          if (await canLaunch(url)) {
            launch(url);
          }
        },
      ),
    );
  }

  _buildPageDots() {
    const double size = 8;
    return Positioned(
      bottom: 13,
      left:
          MediaQuery.of(context).size.width / 2 - widget.children.length * size,
      child: Container(
        height: size,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: widget.children.length,
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
