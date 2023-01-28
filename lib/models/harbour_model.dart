class HarbourModel {
  final String harborId;
  final String harborName;

  HarbourModel({
    required this.harborId,
    required this.harborName,
  });

  factory HarbourModel.fromJson(Map<String, dynamic> json) {
    return HarbourModel(
      harborId: json['harbor_id'],
      harborName: json['harbor_name'],
    );
  }
}
