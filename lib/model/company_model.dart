class CompanyModel {
  final String id;
  final String assessmentRecord;
  final String companyName;
  final String bern;
  final String address;
  final DateTime dated;
  final String indusGroupId;
  final String factorysection;
  final int income;
  final double advancement;
  final int size;
  final bool exportation;
  final bool multiproduction;
  final String preparedById;

  CompanyModel(
      {required this.id,
      required this.assessmentRecord,
      required this.companyName,
      required this.factorysection,
      required this.bern,
      required this.address,
      required this.dated,
      required this.indusGroupId,
      required this.income,
      required this.size,
      required this.exportation,
      required this.multiproduction,
      required this.preparedById,
      required this.advancement});
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['_id'],
      assessmentRecord: json['assessmentRecord'],
      companyName: json['companyName'],
      bern: json['bern'],
      factorysection: json['factorysection'],
      address: json['address'],
      dated: DateTime.parse(json['dated']),
      indusGroupId: json['indusGroup'],
      income: json['income'],
      size: json['size'],
      exportation: json['exportation'],
      multiproduction: json['multiproduction'],
      preparedById: json['preparedBy'],
      advancement: double.parse(json['advancement'].toString())
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'advancement':advancement,
      'assessmentRecord': assessmentRecord,
      'companyName': companyName,
      'bern': bern,
      'address': address,
      'factorysection': factorysection,
      'dated': dated.toIso8601String(),
      'indusGroup': indusGroupId,
      'income': income,
      'size': size,
      'exportation': exportation,
      'multiproduction': multiproduction,
      'preparedBy': preparedById,
    };
  }
}
