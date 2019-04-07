import 'package:helios_app/models/announcment/announcment_model.dart';
import 'package:helios_app/models/cinema/cinema_model.dart';
import 'package:helios_app/models/event/event_descripted_model.dart';
import 'package:helios_app/models/featured_movies/featured_movie_model.dart';
import 'package:helios_app/models/pricing/price_day_model.dart';
import 'package:helios_app/models/pricing/price_model.dart';
import 'package:helios_app/models/pricing/pricing_model.dart';
import 'package:helios_app/models/repertoire/movie_repertoire.dart';
import 'package:helios_app/models/repertoire/repertoire_date_model.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/models/ticket/ticket_model.dart';
import 'package:helios_app/models/ui/home/main/time_of_the_day.dart';
import 'package:helios_app/other/services/abstract/cinema_service.dart';

class CinemaServiceMock implements CinemaService {
  static List<String> _cinemas = [
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

  static List<FeaturedMovieModel> _featuredMovies = [
    FeaturedMovieModel(
      id: 0,
      imageUrl:
          "https://g.gazetaprawna.pl/p/_wspolne/pliki/4009000/4009923-thriller-glass-w-kinach-juz-657-323.jpg",
      title: "Glass",
      category: "Thriller",
      trailerUrl: "http://www.youtube.com",
      repertoireId: 0,
    ),
    FeaturedMovieModel(
      id: 1,
      imageUrl:
          "https://cdn.newsapi.com.au/image/v1/7a89013d506a80498984c698daf7a077?width=1024",
      title: "Iniemamocni -  wczorajszy dzień byłbardzo mocny ",
      category: "Komedia, Fantastyka",
      trailerUrl: "http://www.youtube.com",
      repertoireId: 1,
    ),
    FeaturedMovieModel(
      id: 2,
      imageUrl:
          "https://i.wpimg.pl/O/644x359/d.wpimg.pl/1755570236--882446531/fuga.jpg",
      title: "Fugo",
      category: "Dramat",
      trailerUrl: "https://www.youtube.com/watch?v=X59RHnuSXvY",
      repertoireId: 3,
    )
  ];

  static List<RepertoireModel> _todayRepertoire = _createTodayRepertoire(false);

  static List<EventDescriptedModel> _descriptedEvents = [
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

  static List<AnnouncementModel> _announcements = [
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

  static List<PricingModel> _pricing = [
    PricingModel(
      id: 0,
      title: "Bilety 2D",
      ruleDescription:
          """Od poniedziałku do piątku, na seanse do godz. 13.30 każdy bilet kosztuje jedynie 19,00 zł ! (Promocja nie obejmuje seansów 3D, Świąt i Superwtorku! Wtorek to dzień promocyjny posiadający inne ceny).

Superwtorek – obowiązuje we wtorki, z wyłączeniem dni świątecznych.

(*) młodzież szkolna oraz studenci do 26 roku życia (za okazaniem ważnej legitymacji uczniowskiej/studenckiej)
(**) dzieci do lat 13 oraz osoby powyżej 60 roku życia
(***) cena dla jednej osoby. Oferta ważna przy zakupie biletów dla 2 osób dorosłych plus 1 lub więcej dzieci, lub dla 1 osoby dorosłej plus 2 lub więcej dzieci. Oferta obowiązuje na wszystkie filmy dla dzieci do 13 roku życia.

Zastrzegamy sobie prawo do zmian w repertuarze. Cennik nie dotyczy seansów specjalnych.""",
      days: [
        PriceDayModel(
          id: 0,
          dayName: "Pn, Śr, Czw",
          prices: [
            PriceModel(
              id: 0,
              ticket: TicketModel(id: 0, name: "Normalny"),
              price: 24.50,
            ),
            PriceModel(
              id: 1,
              ticket: TicketModel(id: 1, name: "Ulgowy*"),
              price: 20.50,
            ),
            PriceModel(
              id: 2,
              ticket: TicketModel(id: 2, name: "Junior/Senior**"),
              price: 20.50,
            ),
            PriceModel(
              id: 3,
              ticket: TicketModel(id: 3, name: "Rodzinny***"),
              price: 20.50,
            ),
          ],
        ),
        PriceDayModel(
          id: 1,
          dayName: "Superwtorek!",
          prices: [
            PriceModel(
              id: 4,
              ticket: TicketModel(id: 0, name: "Normalny"),
              price: 14.50,
            ),
            PriceModel(
              id: 5,
              ticket: TicketModel(id: 1, name: "Ulgowy*"),
              price: 14.50,
            ),
            PriceModel(
              id: 6,
              ticket: TicketModel(id: 2, name: "Junior/Senior**"),
              price: 14.50,
            ),
            PriceModel(
              id: 7,
              ticket: TicketModel(id: 3, name: "Rodzinny***"),
              price: 14.50,
            ),
          ],
        ),
        PriceDayModel(
          id: 2,
          dayName: "Pt-Nd, Święta",
          prices: [
            PriceModel(
              id: 8,
              ticket: TicketModel(id: 0, name: "Normalny"),
              price: 26.50,
            ),
            PriceModel(
              id: 9,
              ticket: TicketModel(id: 1, name: "Ulgowy*"),
              price: 22.50,
            ),
            PriceModel(
              id: 10,
              ticket: TicketModel(id: 2, name: "Junior/Senior**"),
              price: 22.50,
            ),
            PriceModel(
              id: 11,
              ticket: TicketModel(id: 3, name: "Rodzinny***"),
              price: 22.50,
            ),
          ],
        ),
      ],
    ),
    PricingModel(
      id: 1,
      title: "Bilety 3D",
      ruleDescription: """+ dopłata 3 zł za okulary

Aby obejrzeć film 3D, niezbędne są specjalne okulary 3D – do nabycia w kasach kina. Cena biletu nie zawiera opłaty za okulary 3D. Jest ona doliczana w trakcie zakupu biletu na seans i wynosi 3 zł, a okulary wręczane są w kasie biletowej. Po obejrzeniu filmu nie wyrzucaj okularów. Zabierz je ze sobą na kolejny seans 3D, a nie będziesz ponosić opłaty za okulary 3D przy zakupie biletu na inne filmy w tej technologii.

Jeżeli Twoje okulary 3D ulegną zarysowaniu lub odbarwieniu, postrzeganie efektu trójwymiaru może być utrudnione. W takim przypadku możesz zakupić nową parę okularów przy kolejnej wizycie w kinie.

(**) Prosimy o sprawdzenie, czy okulary 3D nie są uszkodzone lub zarysowane zaraz po zakupie. Okulary używane nie podlegają reklamacji.

(***) Informujemy, że okulary 3D mogą nie działać w innym kinie niż to, w którym zostały zakupione.""",
      days: [
        PriceDayModel(
          id: 4,
          dayName: "Pn, Śr, Czw",
          prices: [
            PriceModel(
              id: 12,
              ticket: TicketModel(id: 0, name: "Normalny"),
              price: 26.50,
            ),
            PriceModel(
              id: 13,
              ticket: TicketModel(id: 1, name: "Ulgowy*"),
              price: 22.50,
            ),
            PriceModel(
              id: 14,
              ticket: TicketModel(id: 2, name: "Junior/Senior**"),
              price: 22.50,
            ),
            PriceModel(
              id: 15,
              ticket: TicketModel(id: 3, name: "Rodzinny***"),
              price: 22.50,
            ),
          ],
        ),
        PriceDayModel(
          id: 5,
          dayName: "Superwtorek!",
          prices: [
            PriceModel(
              id: 16,
              ticket: TicketModel(id: 0, name: "Normalny"),
              price: 14.50,
            ),
            PriceModel(
              id: 17,
              ticket: TicketModel(id: 1, name: "Ulgowy*"),
              price: 14.50,
            ),
            PriceModel(
              id: 18,
              ticket: TicketModel(id: 2, name: "Junior/Senior**"),
              price: 14.50,
            ),
            PriceModel(
              id: 19,
              ticket: TicketModel(id: 3, name: "Rodzinny***"),
              price: 14.50,
            ),
          ],
        ),
        PriceDayModel(
          id: 6,
          dayName: "Pt-Nd, Święta",
          prices: [
            PriceModel(
              id: 20,
              ticket: TicketModel(id: 0, name: "Normalny"),
              price: 28.50,
            ),
            PriceModel(
              id: 21,
              ticket: TicketModel(id: 1, name: "Ulgowy*"),
              price: 24.50,
            ),
            PriceModel(
              id: 22,
              ticket: TicketModel(id: 2, name: "Junior/Senior**"),
              price: 24.50,
            ),
            PriceModel(
              id: 23,
              ticket: TicketModel(id: 3, name: "Rodzinny***"),
              price: 24.50,
            ),
          ],
        ),
      ],
    )
  ];

  static List<RepertoireDateModel> _repertoire = [
    RepertoireDateModel(
        date: DateTime(2019, 4, 2),
        repertoire: _createTodayRepertoire(true)..shuffle()),
    RepertoireDateModel(
        date: DateTime(2019, 4, 3),
        repertoire: _createTodayRepertoire(true)..shuffle()),
    RepertoireDateModel(
        date: DateTime(2019, 4, 4),
        repertoire: _createTodayRepertoire(true)..shuffle()),
    RepertoireDateModel(
        date: DateTime(2019, 4, 5),
        repertoire: _createTodayRepertoire(true)..shuffle()),
    RepertoireDateModel(
        date: DateTime(2019, 4, 6),
        repertoire: _createTodayRepertoire(true)..shuffle()),
    RepertoireDateModel(
        date: DateTime(2019, 4, 7),
        repertoire: _createTodayRepertoire(true)..shuffle()),
    RepertoireDateModel(
        date: DateTime(2019, 4, 8),
        repertoire: _createTodayRepertoire(true)..shuffle()),
  ];

  static List<MovieRepertoireModel> _movieRepertoire = [
    MovieRepertoireModel(
      id: 0,
      cinemaId: 0,
      date: DateTime(2019, 4, 2),
      repertoireId: 0,
      playHours: [
        DateTime(2019, 4, 2, 8, 30),
        DateTime(2019, 4, 2, 12, 30),
        DateTime(2019, 4, 2, 14, 30),
        DateTime(2019, 4, 2, 16, 30),
        DateTime(2019, 4, 2, 17, 30),
      ],
    ),
    MovieRepertoireModel(
      id: 0,
      cinemaId: 0,
      date: DateTime(2019, 4, 3),
      repertoireId: 0,
      playHours: [
        new DateTime(2019, 4, 3, 10, 15),
        new DateTime(2019, 4, 3, 13, 15),
        new DateTime(2019, 4, 3, 15, 30),
        new DateTime(2019, 4, 3, 18, 30),
      ],
    ),
    MovieRepertoireModel(
      id: 0,
      cinemaId: 0,
      date: DateTime(2019, 4, 4),
      repertoireId: 0,
      playHours: [
        new DateTime(2019, 4, 4, 8, 30),
        new DateTime(2019, 4, 4, 9, 30),
        new DateTime(2019, 4, 4, 11, 30),
        new DateTime(2019, 4, 4, 12, 30),
        new DateTime(2019, 4, 4, 13, 30),
        new DateTime(2019, 4, 4, 14, 30),
        new DateTime(2019, 4, 4, 15, 30),
        new DateTime(2019, 4, 4, 16, 30),
        new DateTime(2019, 4, 4, 17, 30),
        new DateTime(2019, 4, 4, 18, 30),
        new DateTime(2019, 4, 4, 19, 30),
        new DateTime(2019, 4, 4, 20, 30),
        new DateTime(2019, 4, 4, 21, 30),
      ],
    ),
    MovieRepertoireModel(
      id: 0,
      cinemaId: 0,
      date: DateTime(2019, 4, 5),
      repertoireId: 0,
      playHours: [
        DateTime(2019, 4, 2, 8, 30),
        DateTime(2019, 4, 2, 12, 30),
        DateTime(2019, 4, 2, 14, 30),
        DateTime(2019, 4, 2, 16, 30),
        DateTime(2019, 4, 2, 17, 30),
      ],
    ),
    MovieRepertoireModel(
      id: 0,
      cinemaId: 0,
      date: DateTime(2019, 4, 6),
      repertoireId: 0,
      playHours: [
        new DateTime(2019, 4, 12, 10, 0),
        new DateTime(2019, 4, 12, 15, 0),
        new DateTime(2019, 4, 12, 20, 0),
      ],
    ),
    MovieRepertoireModel(
      id: 0,
      cinemaId: 0,
      date: DateTime(2019, 4, 7),
      repertoireId: 0,
      playHours: [
        DateTime(2019, 4, 2, 8, 30),
        DateTime(2019, 4, 2, 12, 30),
        DateTime(2019, 4, 2, 14, 30),
        DateTime(2019, 4, 2, 16, 30),
        DateTime(2019, 4, 2, 17, 30),
      ],
    ),
    MovieRepertoireModel(
      id: 0,
      cinemaId: 0,
      date: DateTime(2019, 4, 8),
      repertoireId: 0,
      playHours: [
        new DateTime(2019, 4, 4, 13, 30),
        new DateTime(2019, 4, 4, 14, 30),
        new DateTime(2019, 4, 4, 15, 30),
        new DateTime(2019, 4, 4, 16, 30),
        new DateTime(2019, 4, 4, 17, 30),
      ],
    ),
    MovieRepertoireModel(
      id: 0,
      cinemaId: 0,
      date: DateTime(2019, 4, 9),
      repertoireId: 0,
      playHours: [
        DateTime(2019, 4, 2, 8, 30),
        DateTime(2019, 4, 2, 12, 30),
        DateTime(2019, 4, 2, 14, 30),
        DateTime(2019, 4, 2, 16, 30),
        DateTime(2019, 4, 2, 17, 30),
      ],
    ),
    MovieRepertoireModel(
      id: 0,
      cinemaId: 0,
      date: DateTime(2019, 4, 10),
      repertoireId: 0,
      playHours: [
        DateTime(2019, 4, 2, 8, 30),
        DateTime(2019, 4, 2, 12, 30),
        DateTime(2019, 4, 2, 14, 30),
        DateTime(2019, 4, 2, 16, 30),
        DateTime(2019, 4, 2, 17, 30),
      ],
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
  Future<List<RepertoireModel>> getTodayRepertoireForCinema(
      int cinemaId, TimeOfTheDayEnum timeOfTheDay) {
    return Future<List<RepertoireModel>>.delayed(Duration(milliseconds: 500),
        () {
      List<RepertoireModel> result = [];

      for (RepertoireModel repertoire in _todayRepertoire) {
        List<DateTime> playHours =
            _getPlayHoursForRepertoireItem(repertoire, timeOfTheDay)
              ..removeWhere(
                (playHour) => playHour
                    .isBefore(DateTime.now().subtract(Duration(minutes: 10))),
              );

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

  @override
  Future<List<PricingModel>> getPricingForCinema(int cinemaId) {
    return Future.delayed(Duration(seconds: 1), () {
      return _pricing;
    });
  }

  @override
  Future<List<RepertoireDateModel>> getRepertoireForCinema(int cinemaId) {
    return Future.delayed(Duration(seconds: 1), () {
      return _repertoire;
    });
  }

  @override
  Future<RepertoireModel> getRepertoireById(int repertoireId) {
    return Future.delayed(Duration(seconds: 1), () {
      return _todayRepertoire.firstWhere((x) => x.id == repertoireId);
    });
  }

  @override
  Future<List<MovieRepertoireModel>> getMovieRepertoire(
      int repertoireId, int cinemaId) {
    return Future.delayed(Duration(seconds: 3), () {
      return _movieRepertoire;
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

  static _createTodayRepertoire(bool trimHours) {
    return [
      new RepertoireModel(
        id: 0,
        category: "Dramat",
        label: "KINO KONESERA",
        title: "Fuga",
        playHours: [
          new DateTime(2019, 4, 12, 8, 50),
          new DateTime(2019, 4, 12, 10, 50),
          new DateTime(2019, 4, 12, 12, 50),
          new DateTime(2019, 4, 12, 14, 50),
          new DateTime(2019, 4, 12, 17, 30),
          new DateTime(2019, 4, 12, 19, 30),
          new DateTime(2019, 4, 12, 21, 30),
        ],
        imageUrl: "https://ssl-gfx.filmweb.pl/po/54/31/755431/7862766.3.jpg",
        labelHex: "#1d5fa3",
        duration: Duration(minutes: 103),
        minYear: 15,
        productionCountries: ["Czechy", "Polska", "Słowacja"],
        productionYear: 2018,
        videoImageUrl:
            "https://i.wpimg.pl/O/644x359/d.wpimg.pl/1755570236--882446531/fuga.jpg",
        actors: [
          "Anya Taylor-Joy",
          "James McAvoy",
          "Bruce Willis",
        ],
        directors: [
          "M. Night Shyamaian",
          "Roy Amera",
        ],
        description:
            "Mistrz horroru, reżyser kulturowego „Szóstego zmysłu”. M.Night Shyamaian powraca z najnowszym filmem  „Glass”!"
            "W Rolach głównych: Bruce Willis, Samuel L.Jackson i James mcAvoy."
            "Bestia budzi się w styczniu!",
        releaseDate: DateTime(18, 1, 18),
        screenWriters: ["M. Night Shyamaian"],
        galleryUrls: [
          "https://allbox.tv/static/filmy/20/20774/posters/nowy_film_iluzja_2.jpg",
          "https://cdn1.stopklatka.pl/dat/movie/0000000005/0000005276/4qc9vl77gjzo16au9kdff2425.jpg",
          "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
          "https://cojestgrane.pl/l/5dz4.jpeg",
        ],
      ),
      new RepertoireModel(
        id: 1,
        title: "Diablo - Wyścig o wszystko",
        category: "Akcja",
        playHours: [
          new DateTime(2019, 4, 12, 11, 00),
          new DateTime(2019, 4, 12, 15, 00),
          new DateTime(2019, 4, 12, 19, 00),
        ],
        imageUrl:
            "https://ocs-pl.oktawave.com/v1/AUTH_2887234e-384a-4873-8bc5-405211db13a2/splay/2018/12/Diablo-Wy%C5%9Bcig-o-wszystko-film.jpg",
        duration: Duration(minutes: 143),
        minYear: 15,
        productionCountries: ["USA"],
        productionYear: 2019,
        videoImageUrl:
            "https://bi.im-g.pl/im/12/3b/17/z24362258IH,Diablo--Wyscig-o-wszystko.jpg",
        actors: [
          "Anya Taylor-Joy",
          "James McAvoy",
          "Bruce Willis",
        ],
        directors: [
          "M. Night Shyamaian",
          "Roy Amera",
        ],
        description:
            "Mistrz horroru, reżyser kulturowego „Szóstego zmysłu”. M.Night Shyamaian powraca z najnowszym filmem  „Glass”!"
            "W Rolach głównych: Bruce Willis, Samuel L.Jackson i James mcAvoy."
            "Bestia budzi się w styczniu!",
        releaseDate: DateTime(18, 1, 18),
        screenWriters: ["M. Night Shyamaian"],
        galleryUrls: [
          "https://allbox.tv/static/filmy/20/20774/posters/nowy_film_iluzja_2.jpg",
          "https://cdn1.stopklatka.pl/dat/movie/0000000005/0000005276/4qc9vl77gjzo16au9kdff2425.jpg",
          "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
          "https://cojestgrane.pl/l/5dz4.jpeg",
        ],
        trailerUrl: "http://www.youtube.com",
      ),
      new RepertoireModel(
        id: 2,
        title: "Iluzja 2",
        category: "Akcja / Przygodowy",
        playHours: [
          new DateTime(2019, 4, 12, 9, 30),
          new DateTime(2019, 4, 12, 11, 30),
          new DateTime(2019, 4, 12, 13, 30),
          new DateTime(2019, 4, 12, 15, 30),
          new DateTime(2019, 4, 12, 17, 30),
          new DateTime(2019, 4, 12, 19, 30),
        ],
        imageUrl: "https://ssl-gfx.filmweb.pl/po/64/33/696433/7741332.3.jpg",
        minYear: 12,
        productionCountries: [
          "USA",
          "Kanada",
        ],
        productionYear: 2018,
        duration: Duration(minutes: 115),
        videoImageUrl: "https://1.fwcdn.pl/an/np/875720/2016/3949_1.7.jpg",
        actors: [
          "Anya Taylor-Joy",
          "James McAvoy",
          "Bruce Willis",
        ],
        directors: [
          "M. Night Shyamaian",
          "Roy Amera",
        ],
        description:
            "Mistrz horroru, reżyser kulturowego „Szóstego zmysłu”. M.Night Shyamaian powraca z najnowszym filmem  „Glass”!"
            "W Rolach głównych: Bruce Willis, Samuel L.Jackson i James mcAvoy."
            "Bestia budzi się w styczniu!",
        releaseDate: DateTime(18, 1, 18),
        screenWriters: ["M. Night Shyamaian"],
        galleryUrls: [
          "https://allbox.tv/static/filmy/20/20774/posters/nowy_film_iluzja_2.jpg",
          "https://cdn1.stopklatka.pl/dat/movie/0000000005/0000005276/4qc9vl77gjzo16au9kdff2425.jpg",
          "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
          "https://cojestgrane.pl/l/5dz4.jpeg",
        ],
        trailerUrl: "http://www.youtube.com",
      ),
      new RepertoireModel(
        id: 3,
        title: "Ralph Demolka w internecie",
        category: "Komedia / Animacja",
        playHours: [
          new DateTime(2019, 4, 12, 10, 15),
          new DateTime(2019, 4, 12, 13, 15),
          new DateTime(2019, 4, 12, 15, 30),
          new DateTime(2019, 4, 12, 18, 30),
        ],
        imageUrl: "https://i1.fdbimg.pl/31hxayy1/1433x2048_pjjrw3.jpg",
        duration: Duration(minutes: 113),
        productionCountries: ["USA"],
        productionYear: 2018,
        minYear: 6,
        videoImageUrl: "https://i.ytimg.com/vi/R5fMi9OpiYo/maxresdefault.jpg",
        actors: [
          "Anya Taylor-Joy",
          "James McAvoy",
          "Bruce Willis",
        ],
        directors: [
          "M. Night Shyamaian",
          "Roy Amera",
        ],
        description:
            "Mistrz horroru, reżyser kulturowego „Szóstego zmysłu”. M.Night Shyamaian powraca z najnowszym filmem  „Glass”!"
            "W Rolach głównych: Bruce Willis, Samuel L.Jackson i James mcAvoy."
            "Bestia budzi się w styczniu!",
        releaseDate: DateTime(18, 1, 18),
        screenWriters: ["M. Night Shyamaian"],
        galleryUrls: [
          "https://allbox.tv/static/filmy/20/20774/posters/nowy_film_iluzja_2.jpg",
          "https://cdn1.stopklatka.pl/dat/movie/0000000005/0000005276/4qc9vl77gjzo16au9kdff2425.jpg",
          "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
          "https://cojestgrane.pl/l/5dz4.jpeg",
        ],
        trailerUrl: "http://www.youtube.com",
      ),
      new RepertoireModel(
        id: 4,
        title: "Sekretny świat kotów",
        category: "Animacja",
        playHours: [
          new DateTime(2019, 4, 12, 10, 0),
          new DateTime(2019, 4, 12, 15, 0),
          new DateTime(2019, 4, 12, 20, 0),
        ],
        label: "PREMIERA",
        labelHex: "#bb2f38",
        imageUrl: "https://ssl-gfx.filmweb.pl/po/55/36/815536/7865965.3.jpg",
        duration: Duration(minutes: 97),
        minYear: 7,
        productionCountries: ["Chiny"],
        productionYear: 2018,
        videoImageUrl: "https://i.ytimg.com/vi/odmaWkTYstU/maxresdefault.jpg",
        actors: [
          "Anya Taylor-Joy",
          "James McAvoy",
          "Bruce Willis",
        ],
        directors: [
          "M. Night Shyamaian",
          "Roy Amera",
        ],
        description:
            "Mistrz horroru, reżyser kulturowego „Szóstego zmysłu”. M.Night Shyamaian powraca z najnowszym filmem  „Glass”!"
            "W Rolach głównych: Bruce Willis, Samuel L.Jackson i James mcAvoy."
            "Bestia budzi się w styczniu!",
        releaseDate: DateTime(18, 1, 18),
        screenWriters: ["M. Night Shyamaian"],
        galleryUrls: [
          "https://allbox.tv/static/filmy/20/20774/posters/nowy_film_iluzja_2.jpg",
          "https://cdn1.stopklatka.pl/dat/movie/0000000005/0000005276/4qc9vl77gjzo16au9kdff2425.jpg",
          "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
          "https://cojestgrane.pl/l/5dz4.jpeg",
        ],
        trailerUrl: "http://www.youtube.com",
      ),
      new RepertoireModel(
        id: 5,
        title: "Bodyguard",
        category: "Dramat / Thriller",
        playHours: [
          new DateTime(2019, 4, 12, 8, 30),
          new DateTime(2019, 4, 12, 9, 30),
          new DateTime(2019, 4, 12, 11, 30),
          new DateTime(2019, 4, 12, 12, 30),
          new DateTime(2019, 4, 12, 13, 30),
          new DateTime(2019, 4, 12, 14, 30),
          new DateTime(2019, 4, 12, 15, 30),
          new DateTime(2019, 4, 12, 16, 30),
          new DateTime(2019, 4, 12, 17, 30),
          new DateTime(2019, 4, 12, 18, 30),
          new DateTime(2019, 4, 12, 19, 30),
          new DateTime(2019, 4, 12, 20, 30),
          new DateTime(2019, 4, 12, 21, 30),
        ],
        imageUrl:
            "https://farm7.staticflickr.com/6081/6087580503_48fb72dc51_b.jpg",
        minYear: 13,
        duration: Duration(minutes: 124),
        productionCountries: ["USA"],
        productionYear: 2019,
        videoImageUrl:
            "https://occ-0-27-28.1.nflxso.net/art/3bd5b/709431a41fb1a1087a2c728434a7c15bb0f3bd5b.jpg",
        actors: [
          "Anya Taylor-Joy",
          "James McAvoy",
          "Bruce Willis",
        ],
        directors: [
          "M. Night Shyamaian",
          "Roy Amera",
        ],
        description:
            "Mistrz horroru, reżyser kulturowego „Szóstego zmysłu”. M.Night Shyamaian powraca z najnowszym filmem  „Glass”!"
            "W Rolach głównych: Bruce Willis, Samuel L.Jackson i James mcAvoy."
            "Bestia budzi się w styczniu!",
        releaseDate: DateTime(18, 1, 18),
        screenWriters: ["M. Night Shyamaian"],
        galleryUrls: [
          "https://allbox.tv/static/filmy/20/20774/posters/nowy_film_iluzja_2.jpg",
          "https://cdn1.stopklatka.pl/dat/movie/0000000005/0000005276/4qc9vl77gjzo16au9kdff2425.jpg",
          "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
          "https://cojestgrane.pl/l/5dz4.jpeg",
        ],
        trailerUrl: "http://www.youtube.com",
      ),
    ];
  }
}
