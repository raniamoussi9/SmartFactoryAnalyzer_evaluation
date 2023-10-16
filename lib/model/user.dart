class User {
  final String id;
  final String userName;
  final String email;
  final String password;
  final int phoneNumber;
  final bool isAdmin;

  User(
      {required this.id,
      required this.userName,
      required this.isAdmin,
      required this.phoneNumber,
      required this.email,
      required this.password});

  Map<String, Object> toJson() {
    return {
      "fullname": userName,
      "_id": id,
      "password": password ,
      "email": email,
      "phoneNumber": phoneNumber,
      "isadmin" : isAdmin
    };
  }

  static fromJson(Map<String, dynamic> user) {
    return User(
        id: user["_id"] as String,
        userName: user["fullname"] as String,
        email: user["email"] as String,
        phoneNumber: user['phoneNumber'] as int,
        isAdmin: user['isadmin'] as bool,
        password: user['password'] as String);
  }
}
