class UserModel {
  String message;
  String token;

  UserModel({
    required this.message,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      message: json['message'] ?? "",
      token: json['token'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
    };
  }
}
