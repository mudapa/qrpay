class UserModel {
  int id;
  String? name, email;
  String message;
  String token;

  UserModel({
    required this.id,
    this.name,
    this.email,
    required this.message,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] as String?,
      email: json['email'] as String?,
      message: json['message'] ?? "",
      token: json['token'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'message': message,
      'token': token,
    };
  }
}
