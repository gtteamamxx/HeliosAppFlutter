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

class PriceIndentifiedByDayModel extends PriceModel {
  PriceIndentifiedByDayModel({
    this.priceDayId,
    id,
    ticket,
    price,
  }) : super(id: id, ticket: ticket, price: price);

  final int priceDayId;
}
