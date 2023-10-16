class AnnualRevenueModel {
  final String assessementRecord;
  final double aftermarketservices;
  final double depreciation;
  final double labour;
  final double maintenanceandrepair;
  final double rawmaterialandConsumable;
  final double researchandDevelopment;
  final double rentalOperatingLease;
  final double sellinggeneralexpenses;
  final double transportationandDistribution;
  final double utilities;

  AnnualRevenueModel({
    required this.assessementRecord,
    required this.aftermarketservices,
    required this.depreciation,
    required this.labour,
    required this.maintenanceandrepair,
    required this.rawmaterialandConsumable,
    required this.researchandDevelopment,
    required this.rentalOperatingLease,
    required this.sellinggeneralexpenses,
    required this.transportationandDistribution,
    required this.utilities,
  });

  // Convert the object to a Map for serialization
  Map<String, dynamic> toJson() {
    return {
      'assessmentRecord': assessementRecord,
      'aftermarketservices': aftermarketservices,
      'depreciation': depreciation,
      'labour': labour,
      'maintenanceandrepair': maintenanceandrepair,
      'rawmaterialandConsumable': rawmaterialandConsumable,
      'researchandDevelopment': researchandDevelopment,
      'rentalOperatingLease': rentalOperatingLease,
      'sellinggeneralexpenses': sellinggeneralexpenses,
      'transportationandDistribution': transportationandDistribution,
      'utilities': utilities,
    };
  }

  // Create an instance from a Map using named constructor
  factory AnnualRevenueModel.fromJson(Map<String, dynamic> json) {
    return AnnualRevenueModel(
      assessementRecord: json['assessmentRecord'],
      aftermarketservices: json['aftermarketservices'],
      depreciation: json['depreciation'],
      labour: json['labour'],
      maintenanceandrepair: json['maintenanceandrepair'],
      rawmaterialandConsumable: json['rawmaterialandConsumable'],
      researchandDevelopment: json['researchandDevelopment'],
      rentalOperatingLease: json['rentalOperatingLease'],
      sellinggeneralexpenses: json['sellinggeneralexpenses'],
      transportationandDistribution: json['transportationandDistribution'],
      utilities: json['utilities'],
    );
  }
}
