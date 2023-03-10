class OutletModel {
  int? id;
  String? name;
  String? address;
  String? phone;
  String? email;
  String? website;

  OutletModel({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.email,
    this.website,
  });

  factory OutletModel.fromJson(Map<String, dynamic> json) {
    return OutletModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      address: json['address'] ?? "",
      phone: json['phone'] ?? "",
      email: json['email'] ?? "",
      website: json['website'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'website': website,
    };
  }
}
