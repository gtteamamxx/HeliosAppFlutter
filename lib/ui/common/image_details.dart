import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({
    this.imageProvider,
    this.loadingChild,
    this.heroTag,
  });

  final ImageProvider imageProvider;
  final Widget loadingChild;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: PhotoView(
        imageProvider: imageProvider,
        loadingChild: loadingChild,
        minScale: PhotoViewComputedScale.covered * 0.3,
        maxScale: PhotoViewComputedScale.covered * 2,
        heroTag: this.heroTag,
      ),
    );
  }
}
