import 'package:flutter/material.dart';
import 'package:helios_app/models/announcment/announcment_model.dart';
import 'package:helios_app/other/helpers/constants.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/ui/common/error_button.dart';
import 'package:helios_app/ui/common/headered_widget.dart';
import 'package:helios_app/ui/common/helios_text.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AnnouncementsList extends StatelessWidget {
  AnnouncementsList({
    this.announcements,
    this.isLoading,
    this.isError,
    this.refreshClick,
  });

  final List<AnnouncementModel> announcements;
  final bool isLoading;
  final bool isError;
  final VoidCallback refreshClick;

  final double headerFontSize = 15;

  @override
  Widget build(BuildContext context) {
    return HeaderedWidget(
      backgroundColor: HeliosColors.backgroundTertiary,
      title: "Zapowiedzi",
      buttonText: "Więcej zapowiedzi",
      onButtonTap: () {},
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: this.isError || this.isLoading ? 300 : 800,
        child: AnimatedSwitcher(
          duration: Constants.fadeInDuration,
          child: this.isLoading
              ? _buildLoading()
              : this.isError ? _buildError() : _buildAnnouncements(),
        ),
      ),
    );
  }

  _buildError() {
    return ErrorButton(
      title: "Wystąpił błąd podczas wczytywania zapowiedzi",
      refreshClick: this.refreshClick,
    );
  }

  _buildAnnouncements() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: this.announcements.length,
      itemBuilder: (context, item) {
        AnnouncementModel announcement = this.announcements[item];
        return Container(
          height: 200,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: InkWell(
            onTap: () async {
              if (await canLaunch(announcement.videoUrl)) {
                launch(announcement.videoUrl);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: FadeInImage.assetNetwork(
                          image: announcement.imageUrl,
                          placeholder: Constants.shimmerPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Image.asset(
                        'assets/play_icon.png',
                        color: Colors.white.withAlpha(180),
                        scale: 2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HeliosText(
                        DateFormat("dd.MM").format(announcement.date),
                        fontWeight: FontWeight.w100,
                        fontSize: headerFontSize,
                      ),
                      SizedBox(width: 5),
                      HeliosText(
                        announcement.title,
                        fontWeight: FontWeight.w600,
                        fontSize: headerFontSize,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }
}
