import 'package:flutter/material.dart';
import 'package:helios_app/models/event/event_descripted_model.dart';
import 'package:helios_app/other/helpers/constants.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/ui/common/error_button.dart';
import 'package:helios_app/ui/common/headered_widget.dart';
import 'package:helios_app/ui/common/helios_text.dart';

class EventsList extends StatelessWidget {
  EventsList({
    Key key,
    @required this.isLoading,
    @required this.events,
    @required this.isError,
    @required this.refreshClick,
  });

  final bool isLoading;
  final bool isError;
  final List<EventDescriptedModel> events;
  final VoidCallback refreshClick;

  final double eventHeaderFontSize = 15;
  final double eventDescriptionFontSize = 13;

  @override
  Widget build(BuildContext context) {
    return HeaderedWidget(
      title: "Wydarzenia",
      backgroundColor: HeliosColors.backgroundFourth,
      buttonText: "Więcej wydarzeń",
      onButtonTap: () {},
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: this.isLoading || this.isError ? 300 : 550,
        child: AnimatedSwitcher(
          duration: Constants.fadeInDuration,
          child: this.isLoading
              ? _buildLoading()
              : this.isError ? _buildError(context) : _buildEvents(),
        ),
      ),
    );
  }

  _buildError(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      child: ErrorButton(
        title: "Wystąpil błąd podczas pobierania wydarzeń",
        refreshClick: this.refreshClick,
      ),
    );
  }

  _buildEvents() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 5),
      itemCount: this.events.length,
      itemBuilder: (context, item) {
        EventDescriptedModel event = this.events[item];
        return Container(
          height: 175,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeliosText(
                event.title,
                fontSize: this.eventHeaderFontSize,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: FadeInImage.assetNetwork(
                          image: event.imageUrl,
                          placeholder: Constants.shimmerPath,
                          height: 125,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: HeliosText(
                          event.description,
                          fontSize: this.eventDescriptionFontSize,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }
}
