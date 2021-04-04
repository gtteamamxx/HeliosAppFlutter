import 'package:helios_app_flutter_x/models/image/image_model.dart';

class EventDescriptedModel {
  EventDescriptedModel({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  final int id;
  final String title;
  final String description;
  final ImageModel image;
}
