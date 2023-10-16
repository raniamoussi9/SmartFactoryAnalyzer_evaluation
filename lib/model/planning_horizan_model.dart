class PlanningHorizonModel {
  String assessmentRecord;
  bool strategic;
  bool tactical;
  bool operational;

  PlanningHorizonModel({
    required this.assessmentRecord,
    required this.strategic,
    required this.tactical,
    required this.operational,
  });

  factory PlanningHorizonModel.fromJson(Map<String, dynamic> json) {
    return PlanningHorizonModel(
      assessmentRecord: json['assessmentRecord'],
      strategic: json['strategic'],
      tactical: json['tactical'],
      operational: json['operational'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'assessmentRecord': assessmentRecord,
      'strategic': strategic,
      'tactical': tactical,
      'operational': operational,
    };
  }
}
