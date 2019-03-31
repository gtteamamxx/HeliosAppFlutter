import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/redux/actions/home/main/fetch_featured_movies_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/ui/common/image_carousel.dart';
import 'package:helios_app/ui/home/main/repertoire_list.dart';
import 'package:helios_app/viewmodels/home/main/main_page_view_model.dart';

class MainPage extends StatelessWidget {
  MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainPageViewModel>(
      converter: (store) => MainPageViewModel.fromStore(store),
      onInit: (store) {
        store.dispatch(FetchFeaturedMoviesAction());
      },
      builder: (context, viewModel) => ListView(
            padding: EdgeInsets.all(0),
            children: [
              ImageCarousel(
                height: 250,
                children: viewModel.featuredMovies,
                isLoading: viewModel.isFeaturedMoviesLoading,
              ),
              RepertoireList(
                height: 500,
              ),
              Container(
                height: 500,
                color: Colors.blue,
              )
            ],
          ),
    );
  }
}
