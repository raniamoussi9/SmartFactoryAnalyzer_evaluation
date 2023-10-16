class DimensionModel {
  final String assessmentRecord;
  final int dimensionId;
  final int dimensionAssesement;
  final String bandComment;

  DimensionModel(
      {
      required this.dimensionAssesement,
      required this.bandComment,
      required this.dimensionId,
      required this.assessmentRecord,
      });
  factory DimensionModel.fromJson(Map<String, dynamic> json) {
    return DimensionModel(
      assessmentRecord: json['assessmentRecord'],
      dimensionAssesement: json['dimensionAssement'],
      bandComment:  json['bandComment'],
      dimensionId: json['dimension'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'assessmentRecord': assessmentRecord,
      'dimensionAssement' : dimensionAssesement,
      'dimension' : dimensionId,
      'bandComment' : bandComment
      
    };
  }
}
