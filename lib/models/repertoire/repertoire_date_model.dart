import 'package:helios_app/models/repertoire/repertoire_model.dart';

class RepertoireDateModel {
  RepertoireDateModel({
    this.date,
    this.repertoire,
  });

  final DateTime date;
  final List<RepertoireModel> repertoire;
}
