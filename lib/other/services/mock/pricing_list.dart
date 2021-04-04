import 'package:helios_app_flutter_x/models/pricing/price_day_model.dart';
import 'package:helios_app_flutter_x/models/pricing/price_model.dart';
import 'package:helios_app_flutter_x/models/pricing/pricing_model.dart';
import 'package:helios_app_flutter_x/models/ticket/ticket_model.dart';

List<PricingModel> pricingMock = [
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
