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

class Transaction {
  String userId;
  int outletId;
  int transactionAmount;
  String transactionDate;
  int transactionStatus;
  int totalTransaction;
  String updatedAt;
  String createdAt;
  int id;

  Transaction({
    required this.userId,
    required this.outletId,
    required this.transactionAmount,
    required this.transactionDate,
    required this.transactionStatus,
    required this.totalTransaction,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      userId: json['user_id'] as String,
      outletId: json['outlet_id'] as int,
      transactionAmount: json['transaction_amount'] as int,
      transactionDate: json['transaction_date'] as String,
      transactionStatus: json['transaction_status'] as int,
      totalTransaction: json['total_transaction'] as int,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'outlet_id': outletId,
      'transaction_amount': transactionAmount,
      'transaction_date': transactionDate,
      'transaction_status': transactionStatus,
      'total_transaction': totalTransaction,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}

class TransactionPlayground {
  int transactionId;
  String playgroundId;
  String updatedAt;
  String createdAt;
  int id;

  TransactionPlayground({
    required this.transactionId,
    required this.playgroundId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory TransactionPlayground.fromJson(Map<String, dynamic> json) {
    return TransactionPlayground(
      transactionId: json['transaction_id'] as int,
      playgroundId: json['playground_id'] as String,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transaction_id': transactionId,
      'playground_id': playgroundId,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}

class TransactionWahanaModel {
  String message;
  Transaction transaction;
  TransactionPlayground transactionPlayground;

  TransactionWahanaModel({
    required this.message,
    required this.transaction,
    required this.transactionPlayground,
  });

  factory TransactionWahanaModel.fromJson(Map<String, dynamic> json) {
    return TransactionWahanaModel(
      message: json['message'] as String,
      transaction: Transaction.fromJson(json['transaction'] ?? {}),
      transactionPlayground:
          TransactionPlayground.fromJson(json['transaction_playground'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'transaction': transaction.toJson(),
      'transaction_playground': transactionPlayground.toJson(),
    };
  }
}
