import 'package:flutter/material.dart';
import 'package:helios_app/ui/common/image_carousel.dart';
import 'package:helios_app/ui/common/image_carousel_item.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ImageCarousel(
            height: 250,
            children: [
              ImageCarouselItem(
                image: Image.network(
                  "https://g.gazetaprawna.pl/p/_wspolne/pliki/4009000/4009923-thriller-glass-w-kinach-juz-657-323.jpg",
                  fit: BoxFit.cover,
                ),
                title: "Glass",
                category: "Thriller",
                trailerUrl: "http://www.youtube.com",
              ),
              ImageCarouselItem(
                image: Image.network(
                  "https://cdn.newsapi.com.au/image/v1/7a89013d506a80498984c698daf7a077?width=1024",
                  fit: BoxFit.cover,
                ),
                title: "Iniemamocni",
                category: "Komedia, Fantastyka",
                trailerUrl: "http://www.youtube.com",
              )
            ],
          ),
        ],
      ),
    );
  }
}
