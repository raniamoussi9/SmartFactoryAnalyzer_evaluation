

class User {
  final String id;
  final String userName;
  final String email;
  final String password;

  User(
      {required this.id,
      required this.userName,
      required this.email,
      required this.password});

  Map<String, String> toJson() {
    return {
      "name": this.userName,
      "_id": this.id,
      "password": this.password,
      "email": this.email
    };
  }

  static fromJson(Map<String, dynamic> user) {
    return User(
        id: user["_id"] as String ,
        userName: user["name"] as String ,
        email: user["email"] as String,
        password: user['password'] as String);
  }
}
