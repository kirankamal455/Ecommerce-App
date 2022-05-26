import 'dart:convert';

import 'package:flutter/foundation.dart';

class Cart {
  final int id;
  final int userId;
  final String date;
  final List<Product> products;
  final int v;
  Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  Cart copyWith({
    int? id,
    int? userId,
    String? date,
    List<Product>? products,
    int? v,
  }) {
    return Cart(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      products: products ?? this.products,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'userId': userId});
    result.addAll({'date': date});
    result.addAll({'products': products.map((x) => x.toMap()).toList()});
    result.addAll({'__v': v});

    return result;
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      date: map['date'] ?? '',
      products:
          List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
      v: map['__v']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cart(id: $id, userId: $userId, date: $date, products: $products, __v: $v)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cart &&
        other.id == id &&
        other.userId == userId &&
        other.date == date &&
        listEquals(other.products, products) &&
        other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        date.hashCode ^
        products.hashCode ^
        v.hashCode;
  }
}

class Product {
  final int productId;
  final int quantity;
  Product({
    required this.productId,
    required this.quantity,
  });

  Product copyWith({
    int? productId,
    int? quantity,
  }) {
    return Product(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'productId': productId});
    result.addAll({'quantity': quantity});

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId']?.toInt() ?? 0,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() => 'Product(productId: $productId, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.productId == productId &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => productId.hashCode ^ quantity.hashCode;
}
