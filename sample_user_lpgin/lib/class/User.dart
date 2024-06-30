class User {
  final String userID;
  final String username;
  final String email;
  final String userType;
  final String token;
  final String name;
  final String contactNumber;
  final String status;

  User({
    required this.userID,
    required this.username,
    required this.email,
    required this.userType,
    required this.token,
    required this.name,
    required this.contactNumber,
    required this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'],
      username: json['username'],
      email: json['email'],
      userType: json['userType'],
      token: json['token'],
      name: json['name'],
      contactNumber: json['contactNumber'],
      status: json['status'],
    );
  }
}
