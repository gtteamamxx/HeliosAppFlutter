import 'package:helios_app/models/cinema/cinema_model.dart';
import 'package:helios_app/models/featured_movies/featured_movie.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/other/services/abstract/cinema_service.dart';

class CinemaServiceMock implements CinemaService {
  List<String> _cinemas = [
    'Bełchatów Helios',
    'Białystok Helios Alfa',
    'Białystok Helios Biała',
    'Białystok Helios Jurowiecka',
    'Bielsko-Biała Helios',
    'Bydgoszcz Helios',
    'Dąbrowa Górnicza Helios',
    'Gdańsk Helios Alfa',
    'Gdańsk Helios Forum',
    'Gdańsk Helios Metropolia',
    'Gdynia Helios',
    'Gniezno Helios',
    'Gorzów Wielkopolski Helios',
    'Grudziądz Helios',
    'Jelenia Góra Helios',
    'Kalisz Helios',
    'Katowice Helios',
    'Kędzierzyn - Koźle Helios',
    'Kielce Helios',
    'Konin Helios',
    'Krosno Helios',
    'Legnica Helios',
    'Lubin Helios',
    'Łódź Helios',
    'Nowy Sącz Helios',
    'Olsztyn Helios',
    'Opole Helios',
    'Piła Helios',
    'Piotrków Trybunalski Helios',
    'Płock Helios',
    'Poznań Helios',
    'Przemyśl Helios',
    'Radom Helios',
    'Rzeszów Helios Galeria Rzeszów',
    'Rzeszów Helios Powstańców W - wy',
    'Siedlce Helios',
    'Sosnowiec Helios',
    'Stalowa Wola Helios',
    'Starachowice Helios',
    'Szczecin Helios CHR Kupiec',
    'Szczecin Helios Outlet Park',
    'Tczew Helios',
    'Tomaszów Mazowiecki Helios',
    'Warszawa Helios Blue City',
    'Wołomin Helios',
    'Wrocław Helios Aleja Bielany',
    'Wrocław Helios Magnolia Park',
  ];

  List<FeaturedMovieModel> _featuredMovies = [
    FeaturedMovieModel(
      imageUrl:
          "https://g.gazetaprawna.pl/p/_wspolne/pliki/4009000/4009923-thriller-glass-w-kinach-juz-657-323.jpg",
      title: "Glass",
      category: "Thriller",
      trailerUrl: "http://www.youtube.com",
    ),
    FeaturedMovieModel(
      imageUrl:
          "https://cdn.newsapi.com.au/image/v1/7a89013d506a80498984c698daf7a077?width=1024",
      title: "Iniemamocni -  wczorajszy dzień byłbardzo mocny ",
      category: "Komedia, Fantastyka",
      trailerUrl: "http://www.youtube.com",
    ),
  ];

  List<RepertoireModel> _todayRepertoire = [
    new RepertoireModel(
      id: 0,
      category: "Dramat",
      label: "KINO KONESERA",
      title: "Fuga",
      playHours: [
        new DateTime(2019, 4, 1, 8, 50),
        new DateTime(2019, 4, 1, 10, 50),
        new DateTime(2019, 4, 1, 12, 50),
        new DateTime(2019, 4, 1, 14, 50),
        new DateTime(2019, 4, 1, 17, 30),
        new DateTime(2019, 4, 1, 19, 30),
        new DateTime(2019, 4, 1, 21, 30),
      ],
      imageUrl: "https://ssl-gfx.filmweb.pl/po/54/31/755431/7862766.3.jpg",
      labelHex: "#1d5fa3",
    ),
    new RepertoireModel(
      id: 1,
      title: "Diablo - Wyścig o wszystko",
      category: "Akcja",
      playHours: [
        new DateTime(2019, 4, 1, 11, 00),
        new DateTime(2019, 4, 1, 15, 00),
        new DateTime(2019, 4, 1, 19, 00),
      ],
      imageUrl:
          "https://ocs-pl.oktawave.com/v1/AUTH_2887234e-384a-4873-8bc5-405211db13a2/splay/2018/12/Diablo-Wy%C5%9Bcig-o-wszystko-film.jpg",
    ),
    new RepertoireModel(
      id: 2,
      title: "Iluzja 2",
      category: "Akcja / Przygodowy",
      playHours: [
        new DateTime(2019, 4, 1, 9, 30),
        new DateTime(2019, 4, 1, 11, 30),
        new DateTime(2019, 4, 1, 13, 30),
        new DateTime(2019, 4, 1, 15, 30),
        new DateTime(2019, 4, 1, 17, 30),
        new DateTime(2019, 4, 1, 19, 30),
      ],
      imageUrl: "https://ssl-gfx.filmweb.pl/po/64/33/696433/7741332.3.jpg",
    ),
    new RepertoireModel(
      id: 3,
      title: "Ralph Demolka w internecie",
      category: "Komedia / Animacja",
      playHours: [
        new DateTime(2019, 4, 1, 10, 15),
        new DateTime(2019, 4, 1, 13, 15),
        new DateTime(2019, 4, 1, 15, 30),
        new DateTime(2019, 4, 1, 18, 30),
      ],
      imageUrl: "https://i1.fdbimg.pl/31hxayy1/1433x2048_pjjrw3.jpg",
    ),
    new RepertoireModel(
      id: 4,
      title: "Sekretny świat kotów",
      category: "Animacja",
      playHours: [
        new DateTime(2019, 4, 1, 10, 0),
        new DateTime(2019, 4, 1, 15, 0),
        new DateTime(2019, 4, 1, 20, 0),
      ],
      label: "PREMIERA",
      labelHex: "#bb2f38",
      imageUrl: "https://ssl-gfx.filmweb.pl/po/55/36/815536/7865965.3.jpg",
    ),
    new RepertoireModel(
      id: 5,
      title: "Bodyguard",
      category: "Dramat / Thriller",
      playHours: [
        new DateTime(2019, 4, 1, 8, 30),
        new DateTime(2019, 4, 1, 9, 30),
        new DateTime(2019, 4, 1, 11, 30),
        new DateTime(2019, 4, 1, 12, 30),
        new DateTime(2019, 4, 1, 13, 30),
        new DateTime(2019, 4, 1, 14, 30),
        new DateTime(2019, 4, 1, 15, 30),
        new DateTime(2019, 4, 1, 16, 30),
        new DateTime(2019, 4, 1, 17, 30),
        new DateTime(2019, 4, 1, 18, 30),
        new DateTime(2019, 4, 1, 19, 30),
        new DateTime(2019, 4, 1, 20, 30),
        new DateTime(2019, 4, 1, 21, 30),
      ],
      imageUrl:
          "https://farm7.staticflickr.com/6081/6087580503_48fb72dc51_b.jpg",
    ),
  ];

  @override
  Future<List<CinemaModel>> getListOfCinemas(String searchText) {
    return Future<List<CinemaModel>>.delayed(Duration(seconds: 1), () {
      int index = 0;
      List<CinemaModel> cinemas = _cinemas
          .map((cinema) => CinemaModel(id: index++, name: cinema))
          .toList();
      if (searchText.isEmpty) {
        return cinemas;
      } else {
        return cinemas
            .where((x) => x.name.toLowerCase().contains(searchText))
            .toList();
      }
    });
  }

  @override
  Future<List<FeaturedMovieModel>> getFeaturedMovies() {
    return Future<List<FeaturedMovieModel>>.delayed(Duration(seconds: 1), () {
      return _featuredMovies;
    });
  }

  @override
  Future<List<RepertoireModel>> getTodayRepertoire(int cinemaId) {
    return Future<List<RepertoireModel>>.delayed(Duration(milliseconds: 500),
        () {
      return _todayRepertoire;
    });
  }
}
