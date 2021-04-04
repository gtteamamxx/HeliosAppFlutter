import 'package:helios_app_flutter_x/models/event/event_descripted_model.dart';
import 'package:helios_app_flutter_x/models/image/image_model.dart';

List<EventDescriptedModel> eventsMock = [
  EventDescriptedModel(
    id: 0,
    title: "„Lista schindera” powraca na ekrany po 25 latach!",
    description: "Mija 25 lat od premiery jednego z najważnieszych filmów w historii kina. Z okazji tej rocznicy poruszająca...",
    image: ImageModel(
      url: "https://static.ftpn.pl/imgcache/750x430/c//uploads/cropit/1547464889c6e7708bc4b8f61ac485dd4e03729334935836b42315eb43449f1101b3c53f57.jpg",
    ),
  ),
  EventDescriptedModel(
    id: 1,
    title: "Zapraszamy w każdą niedzielę!",
    description: "Ten weekend należy do trzeciej częsci kultowej serii „Kogel Mogel”, na którą czkealiśmy niemal 30! Jak zamienić...",
    image: ImageModel(
      url: "https://static3.bigstockphoto.com/8/4/2/large2/248657938.jpg",
    ),
  ),
  EventDescriptedModel(
    id: 2,
    title: "GLASS w Heliosie",
    description: "Ten film to prawdziwa gratka dla fanów mocnych wrażen.",
    image: ImageModel(
      url: "https://g.gazetaprawna.pl/p/_wspolne/pliki/4009000/4009923-thriller-glass-w-kinach-juz-657-323.jpg",
    ),
  ),
];
