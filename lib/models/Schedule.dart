import 'dart:convert';

class Schedule {
  final String scheduleId;
  final String harborFrom;
  final String harborTo;
  final String scheduleTime;
  final String price;

  Schedule({
    required this.scheduleId,
    required this.harborFrom,
    required this.harborTo,
    required this.scheduleTime,
    required this.price,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      scheduleId: json['schedule_id'],
      harborFrom: json['harbor_from'],
      harborTo: json['harbor_to'],
      scheduleTime: json['schedule_time'],
      price: json['price'],
    );
  }
}