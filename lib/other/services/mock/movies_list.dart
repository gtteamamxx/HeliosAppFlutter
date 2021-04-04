import 'package:helios_app_flutter_x/models/category/category_model.dart';
import 'package:helios_app_flutter_x/models/country/country_model.dart';
import 'package:helios_app_flutter_x/models/image/image_model.dart';
import 'package:helios_app_flutter_x/models/movie/movie_model.dart';
import 'package:helios_app_flutter_x/models/person/country_model.dart';

List<CategoryModel> categoriesMock = [
  CategoryModel(id: 0, name: "Dramat"),
  CategoryModel(id: 1, name: "Akcja"),
  CategoryModel(id: 2, name: "Przygodowy"),
  CategoryModel(id: 3, name: "Komedia"),
  CategoryModel(id: 4, name: "Animacja"),
  CategoryModel(id: 5, name: "Thriller"),
];

List<CountryModel> countriesMock = [
  CountryModel(id: 0, name: "Polska"),
  CountryModel(id: 1, name: "Czechy"),
  CountryModel(id: 2, name: "Słowacja"),
  CountryModel(id: 3, name: "USA"),
  CountryModel(id: 4, name: "Kanada"),
];

List<PersonModel> personsMock = [
  PersonModel(id: 0, name: "Anya Taylor-Joy"),
  PersonModel(id: 1, name: "James McAvoy"),
  PersonModel(id: 2, name: "Bruce Willis"),
  PersonModel(id: 3, name: "M. Night Shyamaian"),
  PersonModel(id: 4, name: "Roy Amera"),
];

List<MovieModel> moviesMock = [
  MovieModel(
    id: 0,
    categories: [categoriesMock[0]],
    label: "KINO KONESERA",
    title: "Fuga",
    image: ImageModel(
      url: "https://fwcdn.pl/fpo/54/31/755431/7862766.3.jpg",
    ),
    labelHex: "#1d5fa3",
    duration: Duration(minutes: 103),
    minYear: 15,
    productionCountries: [
      countriesMock[0],
      countriesMock[1],
      countriesMock[2],
    ],
    productionYear: 2018,
    videoImage: ImageModel(
      url: "https://i.wpimg.pl/O/644x359/d.wpimg.pl/1755570236--882446531/fuga.jpg",
    ),
    actors: [
      personsMock[0],
      personsMock[1],
      personsMock[2],
    ],
    directors: [
      personsMock[3],
      personsMock[4],
    ],
    description: "Mistrz horroru, reżyser kulturowego „Szóstego zmysłu”. M.Night Shyamaian powraca z najnowszym filmem  „Glass”!"
        "W Rolach głównych: Bruce Willis, Samuel L.Jackson i James mcAvoy."
        "Bestia budzi się w styczniu!",
    releaseDate: DateTime(18, 1, 18),
    screenWriters: [personsMock[4]],
    images: [
      ImageModel(
        url: "https://ocs-pl.oktawave.com/v1/AUTH_2887234e-384a-4873-8bc5-405211db13a2/splay/2016/06/iluzja_2_recenzja.jpg",
      ),
      ImageModel(
        url: "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
      ),
      ImageModel(
        url: "https://cdn1.stopklatka.pl/dat/movie/0000000005/0000005276/4qc9vl77gjzo16au9kdff2425.jpg",
      ),
      ImageModel(
        url: "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
      ),
      ImageModel(url: "https://cojestgrane.pl/l/5dz4.jpeg"),
    ],
    trailerUrl: "http://youtube.com",
  ),
  MovieModel(
    id: 1,
    title: "Diablo - Wyścig o wszystko",
    categories: [categoriesMock[1]],
    image: ImageModel(
      url: "https://ocs-pl.oktawave.com/v1/AUTH_2887234e-384a-4873-8bc5-405211db13a2/splay/2018/12/Diablo-Wy%C5%9Bcig-o-wszystko-film.jpg",
    ),
    duration: Duration(minutes: 143),
    minYear: 15,
    productionCountries: [countriesMock[3]],
    productionYear: 2019,
    videoImage: ImageModel(
      url: "https://bi.im-g.pl/im/12/3b/17/z24362258IH,Diablo--Wyscig-o-wszystko.jpg",
    ),
    actors: [
      personsMock[0],
      personsMock[1],
      personsMock[2],
    ],
    directors: [
      personsMock[3],
      personsMock[4],
    ],
    screenWriters: [personsMock[4]],
    description: "Mistrz horroru, reżyser kulturowego „Szóstego zmysłu”. M.Night Shyamaian powraca z najnowszym filmem  „Glass”!"
        "W Rolach głównych: Bruce Willis, Samuel L.Jackson i James mcAvoy."
        "Bestia budzi się w styczniu!",
    releaseDate: DateTime(18, 1, 18),
    images: [
      ImageModel(
        url: "https://ocs-pl.oktawave.com/v1/AUTH_2887234e-384a-4873-8bc5-405211db13a2/splay/2016/06/iluzja_2_recenzja.jpg",
      ),
      ImageModel(
        url: "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
      ),
      ImageModel(
        url: "https://cdn1.stopklatka.pl/dat/movie/0000000005/0000005276/4qc9vl77gjzo16au9kdff2425.jpg",
      ),
      ImageModel(
        url: "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
      ),
      ImageModel(url: "https://cojestgrane.pl/l/5dz4.jpeg"),
    ],
    trailerUrl: "http://youtube.com",
  ),
  MovieModel(
    id: 2,
    title: "Iluzja 2",
    categories: [categoriesMock[1], categoriesMock[2]],
    image: ImageModel(url: "https://fwcdn.pl/fpo/64/33/696433/7741332.3.jpg"),
    minYear: 12,
    productionCountries: [
      countriesMock[3],
      countriesMock[4],
    ],
    productionYear: 2018,
    duration: Duration(minutes: 115),
    videoImage: ImageModel(url: "https://img.vider.info/i/n5vxnn/7/3/i-ja-2-n-w-y-u-s-e-me-2-2016.png"),
    description: "Mistrz horroru, reżyser kulturowego „Szóstego zmysłu”. M.Night Shyamaian powraca z najnowszym filmem  „Glass”!"
        "W Rolach głównych: Bruce Willis, Samuel L.Jackson i James mcAvoy."
        "Bestia budzi się w styczniu!",
    releaseDate: DateTime(18, 1, 18),
    images: [
      ImageModel(
        url: "https://ocs-pl.oktawave.com/v1/AUTH_2887234e-384a-4873-8bc5-405211db13a2/splay/2016/06/iluzja_2_recenzja.jpg",
      ),
      ImageModel(
        url: "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
      ),
      ImageModel(
        url: "https://cdn1.stopklatka.pl/dat/movie/0000000005/0000005276/4qc9vl77gjzo16au9kdff2425.jpg",
      ),
      ImageModel(
        url: "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
      ),
      ImageModel(url: "https://cojestgrane.pl/l/5dz4.jpeg"),
    ],
    trailerUrl: "http://youtube.com",
    actors: [
      personsMock[0],
      personsMock[1],
      personsMock[2],
    ],
    directors: [
      personsMock[3],
      personsMock[4],
    ],
    screenWriters: [personsMock[4]],
  ),
  MovieModel(
    id: 3,
    title: "Ralph Demolka w internecie",
    categories: [categoriesMock[3], categoriesMock[4]],
    image: ImageModel(url: "https://i1.fdbimg.pl/31hxayy1/1433x2048_pjjrw3.jpg"),
    duration: Duration(minutes: 113),
    productionCountries: [countriesMock[4]],
    productionYear: 2018,
    minYear: 6,
    videoImage: ImageModel(
      url: "https://i.ytimg.com/vi/R5fMi9OpiYo/maxresdefault.jpg",
    ),
    description: "Mistrz horroru, reżyser kulturowego „Szóstego zmysłu”. M.Night Shyamaian powraca z najnowszym filmem  „Glass”!"
        "W Rolach głównych: Bruce Willis, Samuel L.Jackson i James mcAvoy."
        "Bestia budzi się w styczniu!",
    releaseDate: DateTime(18, 1, 18),
    images: [
      ImageModel(
        url: "https://ocs-pl.oktawave.com/v1/AUTH_2887234e-384a-4873-8bc5-405211db13a2/splay/2016/06/iluzja_2_recenzja.jpg",
      ),
      ImageModel(
        url: "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
      ),
      ImageModel(
        url: "https://cdn1.stopklatka.pl/dat/movie/0000000005/0000005276/4qc9vl77gjzo16au9kdff2425.jpg",
      ),
      ImageModel(
        url: "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
      ),
      ImageModel(url: "https://cojestgrane.pl/l/5dz4.jpeg"),
    ],
    trailerUrl: "http://youtube.com",
    actors: [
      personsMock[0],
      personsMock[1],
      personsMock[2],
    ],
    directors: [
      personsMock[3],
      personsMock[4],
    ],
    screenWriters: [personsMock[4]],
  ),
  MovieModel(
    id: 4,
    title: "Sekretny świat kotów",
    categories: [categoriesMock[4]],
    label: "PREMIERA",
    labelHex: "#bb2f38",
    image: ImageModel(
      url: "https://fwcdn.pl/fpo/55/36/815536/7865965.3.jpg",
    ),
    duration: Duration(minutes: 97),
    minYear: 7,
    productionCountries: [countriesMock[2]],
    productionYear: 2018,
    videoImage: ImageModel(url: "https://i.ytimg.com/vi/odmaWkTYstU/maxresdefault.jpg"),
    description: "Mistrz horroru, reżyser kulturowego „Szóstego zmysłu”. M.Night Shyamaian powraca z najnowszym filmem  „Glass”!"
        "W Rolach głównych: Bruce Willis, Samuel L.Jackson i James mcAvoy."
        "Bestia budzi się w styczniu!",
    releaseDate: DateTime(18, 1, 18),
    images: [
      ImageModel(
        url: "https://ocs-pl.oktawave.com/v1/AUTH_2887234e-384a-4873-8bc5-405211db13a2/splay/2016/06/iluzja_2_recenzja.jpg",
      ),
      ImageModel(
        url: "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
      ),
      ImageModel(
        url: "https://cdn1.stopklatka.pl/dat/movie/0000000005/0000005276/4qc9vl77gjzo16au9kdff2425.jpg",
      ),
      ImageModel(
        url: "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
      ),
      ImageModel(url: "https://cojestgrane.pl/l/5dz4.jpeg"),
    ],
    trailerUrl: "http://youtube.com",
    actors: [
      personsMock[0],
      personsMock[1],
      personsMock[2],
    ],
    directors: [
      personsMock[3],
      personsMock[4],
    ],
    screenWriters: [personsMock[4]],
  ),
  MovieModel(
    id: 5,
    title: "Bodyguard",
    categories: [categoriesMock[0], categoriesMock[5]],
    image: ImageModel(
      url: "https://farm7.staticflickr.com/6081/6087580503_48fb72dc51_b.jpg",
    ),
    minYear: 13,
    duration: Duration(minutes: 124),
    productionCountries: [countriesMock[1]],
    productionYear: 2019,
    videoImage: ImageModel(
      url: "https://occ-0-27-28.1.nflxso.net/art/3bd5b/709431a41fb1a1087a2c728434a7c15bb0f3bd5b.jpg",
    ),
    description: "Mistrz horroru, reżyser kulturowego „Szóstego zmysłu”. M.Night Shyamaian powraca z najnowszym filmem  „Glass”!"
        "W Rolach głównych: Bruce Willis, Samuel L.Jackson i James mcAvoy."
        "Bestia budzi się w styczniu!",
    releaseDate: DateTime(18, 1, 18),
    images: [
      ImageModel(
        url: "https://ocs-pl.oktawave.com/v1/AUTH_2887234e-384a-4873-8bc5-405211db13a2/splay/2016/06/iluzja_2_recenzja.jpg",
      ),
      ImageModel(
        url: "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
      ),
      ImageModel(
        url: "https://cdn1.stopklatka.pl/dat/movie/0000000005/0000005276/4qc9vl77gjzo16au9kdff2425.jpg",
      ),
      ImageModel(
        url: "https://static2.s-trojmiasto.pl/zdj/c/n/9/1625/620x0/1625181-Czterej-Jezdzcy-tym-razem-zamiast-Isli-Fisher-wsparci-Lizzy-Caplan-wracaja-na.jpg",
      ),
      ImageModel(url: "https://cojestgrane.pl/l/5dz4.jpeg"),
    ],
    trailerUrl: "http://youtube.com",
    actors: [
      personsMock[0],
      personsMock[1],
      personsMock[2],
    ],
    directors: [
      personsMock[3],
      personsMock[4],
    ],
    screenWriters: [personsMock[4]],
  ),
];
