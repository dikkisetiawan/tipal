import 'package:flutter/material.dart';
import 'package:tipal/models/Ticket.dart';

class TicektItem extends StatefulWidget {
  Ticket ticket;
  TicektItem({Key? key, required this.ticket}) : super(key: key);

  @override
  _TicektItemState createState() => _TicektItemState(this.ticket);
}

class _TicektItemState extends State<TicektItem> {
  Ticket ticket;
  _TicektItemState(this.ticket);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Booking Code",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              Text(this.ticket.bookingCode)
            ],
          ),
          Padding(padding: EdgeInsets.only(top:16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Full Name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              Text(ticket.username)
            ],
          ),
          Padding(padding: EdgeInsets.only(top:8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Seats",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              Text(ticket.seat)
            ],
          ),
          Padding(padding: EdgeInsets.only(top:8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Child",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              Text(this.ticket.qtyChild.toString())
            ],
          ),
          Padding(padding: EdgeInsets.only(top:8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Adult",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              Text(this.ticket.qtyAdult.toString())
            ],
          )
        ],
      )
    );
  }
}