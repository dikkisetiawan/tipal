class TicketModel {
  String id;
  String bookingCode;
  String orderDate;
  String scheduleId;
  String harborNameFrom;
  String harborNameTo;
  String scheduleTime;
  String price;
  String qtyAdult;
  String qtyChild;
  String seat;
  String username;

  TicketModel(
      {required this.id,
      required this.bookingCode,
      required this.orderDate,
      required this.scheduleId,
      required this.harborNameFrom,
      required this.harborNameTo,
      required this.scheduleTime,
      required this.price,
      required this.qtyAdult,
      required this.qtyChild,
      required this.seat,
      required this.username});

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
        id: json['id'],
        bookingCode: json['booking_code'],
        orderDate: json['order_date'],
        scheduleId: json['schedule_id'],
        harborNameFrom: json['harbor_name_from'],
        harborNameTo: json['harbor_name_to'],
        scheduleTime: json['schedule_time'],
        price: json['price'],
        qtyAdult: json['qty_adult'],
        qtyChild: json['qty_child'],
        seat: json['seat'],
        username: json['username']);
  }
}
