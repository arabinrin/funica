// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModel {
  ProductModel({
    this.productName,
    this.description,
    this.color,
    this.quantity,
    this.price,
    this.image,
    this.special,
    this.soldQuantity,
    this.review,
    this.rating,
    this.discount,
    this.productId,
    this.productCategory,
    this.productTag,
  });

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productName: map['productName'] as String,
      description: map['description'] as String,
      color: List<String>.from(map['color'] as List<dynamic>),
      quantity: map['quantity']?.toInt() as int,
      price: map['price']?.toDouble() as double,
      image: List<String>.from(map['image'] as List<dynamic>),
      special: map['special'] as bool,
      soldQuantity: map['soldQuantity']?.toInt() as int,
      review: map['review'] != null ? map['review']?.toInt() as int : null,
      rating:
          map['review'] != null ? map['rating']?.toDouble() as double : null,
      discount: map['discount']?.toDouble() as double,
      productId: map['productId'] as String,
      productCategory: map['productCategory'] as String,
      productTag: List<String>.from(map['productTag'] as List<dynamic>),
    );
  }
  final String? productName;
  final String? description;
  final List<String>? color;
  final int? quantity;
  final double? price;
  List<String>? image;
  final bool? special;
  final int? soldQuantity;
  final int? review;
  final double? rating;
  final double? discount;
  final String? productId;
  final String? productCategory;
  final List<String>? productTag;

  ProductModel copyWith({
    String? productName,
    String? description,
    List<String>? color,
    int? quantity,
    double? price,
    List<String>? image,
    bool? special,
    int? soldQuantity,
    int? review,
    double? rating,
    double? discount,
    String? productId,
    String? productCategory,
    List<String>? productTag,
  }) {
    return ProductModel(
      productName: productName ?? this.productName,
      description: description ?? this.description,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      image: image ?? this.image,
      special: special ?? this.special,
      soldQuantity: soldQuantity ?? this.soldQuantity,
      review: review ?? this.review,
      rating: rating ?? this.rating,
      discount: discount ?? this.discount,
      productId: productId ?? this.productId,
      productCategory: productCategory ?? this.productCategory,
      productTag: productTag ?? this.productTag,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'description': description,
      'color': color,
      'quantity': quantity,
      'price': price,
      'image': image,
      'special': special,
      'soldQuantity': soldQuantity,
      'review': review,
      'rating': rating,
      'discount': discount,
      'productId': productId,
      'productCategory': productCategory,
      'productTag': productTag,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ProductModel(productName: $productName, description: $description, color: $color, quantity: $quantity, price: $price, image: $image, special: $special, soldQuantity: $soldQuantity, review: $review, rating: $rating, discount: $discount, productId: $productId, productCategory: $productCategory, productTag: $productTag)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.productName == productName &&
        other.description == description &&
        listEquals(other.color, color) &&
        other.quantity == quantity &&
        other.price == price &&
        listEquals(other.image, image) &&
        other.special == special &&
        other.soldQuantity == soldQuantity &&
        other.review == review &&
        other.rating == rating &&
        other.discount == discount &&
        other.productId == productId &&
        other.productCategory == productCategory &&
        listEquals(other.productTag, productTag);
  }

  @override
  int get hashCode {
    return productName.hashCode ^
        description.hashCode ^
        color.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        image.hashCode ^
        special.hashCode ^
        soldQuantity.hashCode ^
        review.hashCode ^
        rating.hashCode ^
        discount.hashCode ^
        productId.hashCode ^
        productCategory.hashCode ^
        productTag.hashCode;
  }
}

// List<ProductModel> product = [
//   ProductModel(
//       productName: 'Brown Ergonomic Chair',
//       description:
//           'Ergonomic is any work-related item that was specifically designed for maximum comfort and efficiency. An ergonomic office chair is usually defined by having the following features:',
//       color: ['yellow', 'blue', 'red', 'green'],
//       quantity: 4,
//       price: 15.7,
//       image: ['assets/products/lorraine-tufted.png'],
//       favourite: true,
//       special: false,
//       soldQuantity: 5,
//       rating: 3.4,
//       review: 40,
//       discount: 10.0,
//       productId: 'id1',
//       productCategory: 'Chair',
//       productTag: 'Chair furniture comfort'.split(' ')),
//   ProductModel(
//       productName: 'Brown Ergonomic Chair',
//       description:
//           'Ergonomic is any work-related item that was specifically designed for maximum comfort and efficiency. An ergonomic office chair is usually defined by having the following features:',
//       color: ['yellow', 'blue', 'red', 'green'],
//       quantity: 4,
//       price: 15.7,
//       image: ['assets/products/ergonomic.png'],
//       favourite: true,
//       special: false,
//       soldQuantity: 5,
//       rating: 3.4,
//       review: 40,
//       discount: 10.0,
//       productId: 'id1',
//       productCategory: 'Chair',
//       productTag: 'Chair furniture comfort'.split(' ')),
//   ProductModel(
//       productName: 'Lorraine tufted',
//       description:
//           'Construction • Made of kiln-dried solid wood frame. • Crafted from solid wood for easy care, durability, and natural beauty. • Kiln-dried wood helps preven',
//       color: ['yellow', 'blue', 'red', 'green'],
//       quantity: 4,
//       price: 15.7,
//       image: ['assets/products/lorraine-tufted.png'],
//       favourite: true,
//       special: false,
//       soldQuantity: 5,
//       rating: 3.4,
//       review: 40,
//       discount: 10.0,
//       productId: 'id1',
//       productCategory: 'Chair',
//       productTag: 'Chair furniture comfort'.split(' ')),
//   ProductModel(
//       productName: 'Brown Ergonomic Chair',
//       description:
//           'Ergonomic is any work-related item that was specifically designed for maximum comfort and efficiency. An ergonomic office chair is usually defined by having the following features:',
//       color: ['yellow', 'blue', 'red', 'green'],
//       quantity: 4,
//       price: 15.7,
//       image: ['assets/products/ergonomic.png'],
//       favourite: true,
//       special: false,
//       soldQuantity: 5,
//       rating: 3.4,
//       review: 40,
//       discount: 10.0,
//       productId: 'id1',
//       productCategory: 'Chair',
//       productTag: 'Chair furniture comfort'.split(' ')),
// ];
