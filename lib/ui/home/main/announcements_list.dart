import 'package:flutter/material.dart';
import 'package:helios_app/models/announcment/announcment_model.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/ui/common/headered_widget.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AnnouncementsList extends StatelessWidget {
  AnnouncementsList({
    this.announcements,
    this.isLoading,
  });

  final List<AnnouncementModel> announcements;
  final bool isLoading;
  final double headerFontSize = 15;

  @override
  Widget build(BuildContext context) {
    return HeaderedWidget(
      backgroundColor: HeliosColors.backgroundTertiary,
      title: "Zapowiedzi",
      buttonText: "Więcej zapowiedzi",
      onButtonTap: () {},
      child: Container(
        height: 800,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
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
                                    placeholder: 'assets/shimmer_image.gif',
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
                                Text(
                                  DateFormat("dd.MM").format(announcement.date),
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w100,
                                    fontSize: headerFontSize,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  announcement.title,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: headerFontSize,
                                  ),
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
              ),
      ),
    );
  }
}
