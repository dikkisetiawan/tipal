import 'package:flutter/material.dart';
import 'package:tipal/models/Schedule.dart';
import 'package:tipal/view/pages/reservation_page.dart';
import 'package:intl/intl.dart';

class ScheduleItem extends StatefulWidget {
  Schedule schedule;
  ScheduleItem({Key? key, required this.schedule}) : super(key: key);

  @override
  _ScheduleItemState createState() => _ScheduleItemState(this.schedule);
}

class _ScheduleItemState extends State<ScheduleItem> {
  Schedule schedule;
  _ScheduleItemState(this.schedule);
  @override
  Widget build(BuildContext context) {
    var inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    var inputDate = inputFormat.parse(this.schedule.scheduleTime);

    var outputFormat = DateFormat('dd MMM yyyy HH:mm a');
    var outputDate = outputFormat.format(inputDate);

    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${outputDate}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                Text("Rp. ${this.schedule.price}"),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReservationPage(
                            scheduleId: this.schedule.scheduleId)));
              },
              child: Text("Choose"))
        ],
      ),
    );
  }
}
