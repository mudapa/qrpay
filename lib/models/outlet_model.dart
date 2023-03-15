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
      'id': id.toString(),
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'website': website,
    };
  }
}

class AllProductModel {
  int id;
  String name;
  String description;
  String price;
  String image;
  String categoryId;
  String outletId;
  String status;
  String createdBy;
  String updatedBy;

  AllProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.categoryId,
    required this.outletId,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
  });

  factory AllProductModel.fromJson(Map<String, dynamic> json) {
    return AllProductModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      image: json['image'] as String,
      categoryId: json['category_id'] as String,
      outletId: json['outlet_id'] as String,
      status: json['status'] as String,
      createdBy: json['created_by'] as String,
      updatedBy: json['updated_by'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'category_id': categoryId,
      'outlet_id': outletId,
      'status': status,
      'created_by': createdBy,
      'updated_by': updatedBy,
    };
  }
}
