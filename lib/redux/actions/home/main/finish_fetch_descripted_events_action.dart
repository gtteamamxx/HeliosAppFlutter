import 'package:helios_app/models/event/event_descripted_model.dart';

class FinishFetchDescriptedEventsAction {
  FinishFetchDescriptedEventsAction(this.events);
  final List<EventDescriptedModel> events;
}
