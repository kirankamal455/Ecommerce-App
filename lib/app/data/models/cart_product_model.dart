import 'dart:convert';

import 'package:calzada/app/data/models/product_model.dart';

class CartProductModel {
  final Product p;
  final int quantity;
  CartProductModel({
    required this.p,
    required this.quantity,
  });

  CartProductModel copyWith({
    Product? p,
    int? quantity,
  }) {
    return CartProductModel(
      p: p ?? this.p,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'p': p.toMap()});
    result.addAll({'quantity': quantity});

    return result;
  }

  factory CartProductModel.fromMap(Map<String, dynamic> map) {
    return CartProductModel(
      p: Product.fromMap(map['p']),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProductModel.fromJson(String source) =>
      CartProductModel.fromMap(json.decode(source));

  @override
  String toString() => 'CartProductModel(p: $p, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartProductModel &&
        other.p == p &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => p.hashCode ^ quantity.hashCode;
}
