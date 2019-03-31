import 'package:flutter/material.dart';

class ImageCarouselItem extends StatelessWidget {
  ImageCarouselItem({
    @required this.image,
    @required this.title,
    @required this.category,
    @required this.trailerUrl,
  });

  final Image image;
  final String title;
  final String category;
  final String trailerUrl;

  @override
  Widget build(BuildContext context) {
    return image;
  }
}
