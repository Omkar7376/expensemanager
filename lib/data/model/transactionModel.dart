class TransactionModel {
  final String id;
  final num amount;
  final String title;
  final String note;
  final String transactionType;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.title,
    required this.note,
    required this.transactionType,
  });

  TransactionModel.fromJson(dynamic json)
      : id = json['id'] ?? '',
        amount = json['amount'] ?? 0,
        title = json['title'] ?? '',
        note = json['note'] ?? '',
        transactionType = json['transactionType'] ?? 'income';

  TransactionModel copyWith({
    String? id,
    num? amount,
    String? title,
    String? note,
    String? transactionType,
  }) =>
      TransactionModel(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        title: title ?? this.title,
        note: note ?? this.note,
        transactionType: transactionType ?? this.transactionType,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['amount'] = amount;
    map['title'] = title;
    map['note'] = note;
    map['transactionType'] = transactionType;
    return map;
  }
}
