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

  @override
  Future<List<String>> getListOfCinemas(String searchText) {
    return Future<List<String>>.delayed(Duration(seconds: 1), () {
      if (searchText.isEmpty) {
        return _cinemas;
      } else {
        return _cinemas
            .where((x) => x.toLowerCase().contains(searchText))
            .toList();
      }
    });
  }
}
