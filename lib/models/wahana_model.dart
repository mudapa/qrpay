class WahanaModel {
  int? id;
  String? name;
  int? price;
  int? outletId;

  WahanaModel({
    this.id,
    this.name,
    this.price,
    this.outletId,
  });

  factory WahanaModel.fromJson(Map<String, dynamic> json) {
    return WahanaModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      outletId: json['outlet_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'outlet_id': outletId,
    };
  }
}
