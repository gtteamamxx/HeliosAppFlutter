import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/redux/actions/app/change_app_bar_visibility_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:photo_view/photo_view.dart';
import 'package:redux/redux.dart';

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
    return WillPopScope(
      onWillPop: () {
        Store<AppState> store = StoreProvider.of<AppState>(context);
        store.dispatch(ChangeAppBarVisibilityAction(isVisible: true));
        return Future.value(true);
      },
      child: Container(
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
      ),
    );
  }
}
