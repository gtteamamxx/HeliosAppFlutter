import 'package:flutter/material.dart';
import 'package:helios_app/models/event/event_descripted_model.dart';
import 'package:helios_app/other/helpers/constants.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/ui/common/headered_widget.dart';

class EventsList extends StatelessWidget {
  EventsList({
    Key key,
    @required this.isLoading,
    @required this.events,
  });

  final bool isLoading;
  final List<EventDescriptedModel> events;
  final double eventHeaderFontSize = 15;
  final double eventDescriptionFontSize = 13;

  @override
  Widget build(BuildContext context) {
    return HeaderedWidget(
      title: "Wydarzenia",
      backgroundColor: HeliosColors.backgroundFourth,
      buttonText: "Więcej wydarzeń",
      onButtonTap: () {},
      child: Container(
        height: 550,
        child: AnimatedSwitcher(
          duration: Constants.fadeInDuration,
          child: this.isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
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
                          Text(
                            event.title,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: eventHeaderFontSize,
                              fontWeight: FontWeight.w600,
                            ),
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      event.description,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: eventDescriptionFontSize,
                                        fontWeight: FontWeight.w100,
                                      ),
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
                ),
        ),
      ),
    );
  }
}
