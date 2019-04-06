import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';
import 'package:helios_app/redux/actions/home/main/fetch_announcements_light_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_descripted_events_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_featured_movies_action.dart';
import 'package:helios_app/redux/actions/home/main/fetch_repertoire_for_time_of_the_day_action.dart';
import 'package:helios_app/redux/app/app_state.dart';
import 'package:helios_app/ui/common/image_carousel.dart';
import 'package:helios_app/ui/home/main/announcements_list.dart';
import 'package:helios_app/ui/home/main/events_list.dart';
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

        TimeOfTheDayEnum defaultTimeOfTheDay =
            store.state.homeState.mainPageState.selectedRepertoireTimeOfTheDay;
        store.dispatch(
            FetchRepertoireForTimeOfTheDayAction(defaultTimeOfTheDay));

        store.dispatch(FetchDescriptedEventsAction());
        store.dispatch(FetchAnnouncementsLightAction());
      },
      builder: (context, viewModel) => ListView(
            padding: EdgeInsets.zero,
            children: [
              ImageCarousel(
                height: 225,
                children: viewModel.featuredMovies,
                isLoading: viewModel.isFeaturedMoviesLoading,
                isError: viewModel.isFeaturedMoviesError,
                refreshClick: viewModel.onRefreshFeaturedMovies,
                onTap: viewModel.onFeaturedMovieTap,
              ),
              RepertoireList(
                repertoire: viewModel.repertoire,
                isLoading: viewModel.isRepertoireLoading,
                selectedTimeOfTheDay: viewModel.selectedRepertoireTimeOfTheDay,
                timeOfTheDayChange: viewModel.onRepertoireTimeOfTheDayChange,
                isError: viewModel.isRepertoireError,
                refreshClick: viewModel.onRefreshRepertoire,
                repertoireClick: viewModel.onRepertoireClick,
              ),
              EventsList(
                events: viewModel.events,
                isLoading: viewModel.isEventsLoading,
                isError: viewModel.isEventsError,
                refreshClick: viewModel.onRefreshEvents,
              ),
              AnnouncementsList(
                announcements: viewModel.announcements,
                isLoading: viewModel.isAnnouncementsLoading,
                isError: viewModel.isAnnouncementsError,
                refreshClick: viewModel.onRefreshAnnouncements,
              )
            ],
          ),
    );
  }
}
