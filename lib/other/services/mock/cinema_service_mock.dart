import 'package:helios_app/models/announcment/announcment_model.dart';
import 'package:helios_app/models/cinema/cinema_model.dart';
import 'package:helios_app/models/event/event_descripted_model.dart';
import 'package:helios_app/models/featured_movies/featured_movie_model.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';
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

  List<EventDescriptedModel> _descriptedEvents = [
    EventDescriptedModel(
      id: 0,
      title: "„Lista schindera” powraca na ekrany po 25 latach!",
      description:
          "Mija 25 lat od premiery jednego z najważnieszych filmów w historii kina. Z okazji tej rocznicy poruszająca...",
      imageUrl:
          "https://niezaleznacdn.pl/imgcache/750x430/c//uploads/cropit/1547464889c6e7708bc4b8f61ac485dd4e03729334935836b42315eb43449f1101b3c53f57.jpg",
    ),
    EventDescriptedModel(
      id: 1,
      title: "Zapraszamy w każdą niedzielę!",
      description:
          "Ten weekend należy do trzeciej częsci kultowej serii „Kogel Mogel”, na którą czkealiśmy niemal 30! Jak zamienić...",
      imageUrl: "https://static3.bigstockphoto.com/8/4/2/large2/248657938.jpg",
    ),
    EventDescriptedModel(
      id: 2,
      title: "GLASS w Heliosie",
      description: "Ten film to prawdziwa gratka dla fanów mocnych wrażen.",
      imageUrl:
          "https://g.gazetaprawna.pl/p/_wspolne/pliki/4009000/4009923-thriller-glass-w-kinach-juz-657-323.jpg",
    )
  ];

  List<AnnouncementModel> _announcements = [
    AnnouncementModel(
      id: 0,
      title: "Miszmasz, czyli Kogel Mogel 3",
      date: DateTime(2019, 1, 25),
      imageUrl:
          "https://static.wirtualnemedia.pl/media/top/MiszmaszczyliKogel-mogel3nowe-655.JPG",
      videoUrl: "https://www.youtube.com/watch?v=aCcY0z-AnJU",
    ),
    AnnouncementModel(
      id: 1,
      title: "Planeta singli 3",
      date: DateTime(2019, 2, 8),
      imageUrl: "https://ssl-gfx.filmweb.pl/po/45/92/814592/7868675.3.jpg",
      videoUrl: "https://www.youtube.com/watch?v=2ig9C0rsaMs",
    ),
    AnnouncementModel(
      id: 2,
      title: "Lego® Przygoda 2",
      date: DateTime(2019, 1, 8),
      imageUrl:
          "http://filmozercy.com/uploads/images/original/the-lego-movie-2-rex-dangervest-poster.jpeg",
      videoUrl: "https://www.youtube.com/watch?v=WVYvive_iNU",
    ),
    AnnouncementModel(
      id: 3,
      title: "Alita: Battle Angle",
      date: DateTime(2019, 2, 14),
      imageUrl:
          "http://www.filmawka.pl/wp-content/uploads/2019/02/Alita-1.jpeg",
      videoUrl: "https://www.youtube.com/watch?v=w7pYhpJaJW8",
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
  Future<List<RepertoireModel>> getTodayRepertoire(
      int cinemaId, TimeOfTheDayEnum timeOfTheDay) {
    return Future<List<RepertoireModel>>.delayed(Duration(milliseconds: 500),
        () {
      List<RepertoireModel> result = [];

      for (RepertoireModel repertoire in _todayRepertoire) {
        List<DateTime> playHours =
            _getPlayHoursForRepertoireItem(repertoire, timeOfTheDay);
        if (playHours.isNotEmpty) {
          result.add(repertoire.copyWithPlayHours(playHours: playHours));
        }
      }

      return result;
    });
  }

  @override
  Future<List<EventDescriptedModel>> getDescriptedEvents({int eventsNum}) {
    return Future.delayed(Duration(seconds: 4), () {
      return _descriptedEvents;
    });
  }

  @override
  Future<List<AnnouncementModel>> getAnnouncementsLight() {
    return Future.delayed(Duration(seconds: 5), () {
      return _announcements;
    });
  }

  List<DateTime> _getPlayHoursForRepertoireItem(
      RepertoireModel repertoireItem, TimeOfTheDayEnum timeOfTheDay) {
    if (timeOfTheDay == TimeOfTheDayEnum.UntilNoon) {
      return repertoireItem.playHours.where((x) => x.hour < 12).toList();
    } else if (timeOfTheDay == TimeOfTheDayEnum.InTheAfterNoon) {
      return repertoireItem.playHours
          .where((x) => x.hour >= 12 && x.hour < 18)
          .toList();
    } else {
      return repertoireItem.playHours.where((x) => x.hour >= 18).toList();
    }
  }
}
