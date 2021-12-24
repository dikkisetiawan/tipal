import 'dart:convert';

class Harbour {
  final String harborId;
  final String harborName;

  Harbour({
    required this.harborId,
    required this.harborName,
  });

  factory Harbour.fromJson(Map<String, dynamic> json) {
    return Harbour(
      harborId: json['harbor_id'],
      harborName: json['harbor_name'],
    );
  }
}