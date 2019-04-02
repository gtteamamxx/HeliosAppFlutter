import 'package:helios_app/models/ticket/ticket_model.dart';

class PriceModel {
  PriceModel({
    this.id,
    this.ticket,
    this.price,
  });

  final int id;
  final TicketModel ticket;
  final double price;
}
