class IndustryGroupModel {
  final String name;
  final String id;

  IndustryGroupModel({required this.name, required this.id});
  

  // Convert IndustryGroup to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'indusName': name,
    };
  }

  // Create IndustryGroup instance from JSON
  factory IndustryGroupModel.fromJson(Map<String, dynamic> json) {
    return IndustryGroupModel(
      id: json['_id'],
      name: json['indusName'],
    );
  }


}
