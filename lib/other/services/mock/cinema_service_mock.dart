import 'package:helios_app/models/cinema/cinema_model.dart';
import 'package:helios_app/models/featured_movies/featured_movie.dart';
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
}
