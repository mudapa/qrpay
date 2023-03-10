class UserModel {
  String message;
  String token;
  String name;

  UserModel({
    required this.message,
    required this.token,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      message: json['message'] ?? "",
      token: json['token'] ?? "",
      name: json['name'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
      'name': name,
    };
  }
}
