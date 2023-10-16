class AssessmentModel {
  final String assessmentRecord;
  final int assetandEquipmentEfficiency;
  final int workforceEfficiency;
  final int utilitiesEfficiency;
  final int inventoryEfficiency;
  final int materialsEfficiency;
  final int processquality;
  final int productquality;
  final int safety;
  final int security;
  final int planningandschedulingEffectiveness;
  final int productionFlexibility;
  final int workforceFlexibility;
  final int timetomarket;
  final int timetodelivery;

  AssessmentModel({
    required this.assessmentRecord,
    required this.assetandEquipmentEfficiency,
    required this.workforceEfficiency,
    required this.utilitiesEfficiency,
    required this.inventoryEfficiency,
    required this.materialsEfficiency,
    required this.processquality,
    required this.productquality,
    required this.safety,
    required this.security,
    required this.planningandschedulingEffectiveness,
    required this.productionFlexibility,
    required this.workforceFlexibility,
    required this.timetomarket,
    required this.timetodelivery,
  });

  Map<String, dynamic> toJson() {
    return {
      'assessmentRecord': assessmentRecord,
      'assetandEquipmentEfficiency': assetandEquipmentEfficiency,
      'workforceEfficiency': workforceEfficiency,
      'utilitiesEfficiency': utilitiesEfficiency,
      'inventoryEfficiency': inventoryEfficiency,
      'materialsEfficiency': materialsEfficiency,
      'processquality': processquality,
      'productquality': productquality,
      'safety': safety,
      'Security': security,
      'planningandschedulingEffectiveness': planningandschedulingEffectiveness,
      'producutionFlexebility': productionFlexibility,
      'workforceFlexebility': workforceFlexibility,
      'timetomarket': timetomarket,
      'timetodelivery': timetodelivery,
    };
  }

  factory AssessmentModel.fromJson(Map<String, dynamic> json) {
    return AssessmentModel(
      assessmentRecord: json['assessmentRecord'] as String,
      assetandEquipmentEfficiency: json['assetandEquipmentEfficiency'] as int,
      workforceEfficiency: json['workforceEfficiency'] as int,
      utilitiesEfficiency: json['utilitiesEfficiency'] as int,
      inventoryEfficiency: json['inventoryEfficiency'] as int,
      materialsEfficiency: json['materialsEfficiency'] as int,
      processquality: json['processquality'] as int,
      productquality: json['productquality'] as int,
      safety: json['safety'] as int,
      security: json['Security'] as int,
      planningandschedulingEffectiveness:
          json['planningandschedulingEffectiveness'] as int,
      productionFlexibility: json['producutionFlexebility'] as int,
      workforceFlexibility: json['workforceFlexebility'] as int,
      timetomarket: json['timetomarket'] as int,
      timetodelivery: json['timetodelivery'] as int,
    );
  }
}
