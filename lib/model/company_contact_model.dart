class CompanyContactModel {
  final String idCompany;
  final String title;
  final String firstName;
  final String lastName;
  final String designation;
  final int mobileNumber;
  final String email;
  final String companyName;

  CompanyContactModel({
    required this.idCompany,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.designation,
    required this.mobileNumber,
    required this.email,
    required this.companyName
  });
  factory CompanyContactModel.fromJson(Map<String, dynamic> json) {
    return CompanyContactModel(
      companyName: json['companyName'],
      idCompany: json['assessmentRecord'],
      title: json['title'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      designation: json['designation'],
      mobileNumber: json['mobileNumber'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companyName':companyName,
      'assessmentRecord': idCompany,
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'designation': designation,
      'mobileNumber': mobileNumber,
      'email': email,
    };
  }
}
