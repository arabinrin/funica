// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

class ProductModel {
  final String? productName;
  final String? description;
  final List<dynamic>? color;
  final int? quantity;
  final double? price;
  List<dynamic>? image;
  final bool? favourite;
  final bool? special;
  final int? soldQuantity;
  final int? review;
  final double? rating;
  final double? discount;
  final String? productId;
  final String? productCategory;
  final List<dynamic>? productTag;

  ProductModel({
    this.productName,
    this.description,
    this.color,
    this.quantity,
    this.price,
    this.image,
    this.favourite,
    this.special,
    this.soldQuantity,
    this.rating,
    this.review,
    this.discount,
    this.productId,
    this.productCategory,
    this.productTag,
  });

  ProductModel copyWith({
    String? productName,
    String? description,
    List<dynamic>? color,
    int? quantity,
    double? price,
    List<String?>? image,
    bool? favourite,
    bool? special,
    int? soldQuantity,
    int? review,
    double? rating,
    double? discount,
    String? productId,
    String? productCategory,
    List<dynamic>? productTag,
  }) {
    return ProductModel(
      productName: productName ?? this.productName,
      description: description ?? this.description,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      image: image ?? this.image,
      favourite: favourite ?? this.favourite,
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
      'favourite': favourite,
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

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productName: map['productName'] != null ? map['productName'] : null,
      description: map['description'] != null ? map['description'] : null,
      color: map['color'] != null ? List<dynamic>.from(map['color']) : null,
      quantity: map['quantity'] != null ? map['quantity'].toInt() : null,
      price: map['price'] != null ? map['price']?.toDouble() : null,
      image:  map['image'] != null ? List<dynamic>.from(map['image']) : null,
      favourite: map['favourite'] != null ? map['favourite'] : null,
      special: map['special'] != null ? map['special'] : null,
      soldQuantity:
          map['soldQuantity'] != null ? map['soldQuantity']?.toInt() : null,
      review: map['review'] != null ? map['review']?.toInt() : null,
      rating: map['rating'] != null ? map['rating'].toDouble() : null,
      discount: map['discount'] != null ? map['discount']?.toDouble() : null,
      productId: map['productId'] != null ? map['productId'] : null,
      productCategory:
          map['productCategory'] != null ? map['productCategory'] : null,
      productTag: map['productTag'] != null
          ? List<dynamic>.from(map['productTag'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}

List<ProductModel> product = [
  ProductModel(
      productName: 'Brown Ergonomic Chair',
      description:
          'Ergonomic is any work-related item that was specifically designed for maximum comfort and efficiency. An ergonomic office chair is usually defined by having the following features:',
      color: ['yellow', 'blue', 'red', 'green'],
      quantity: 4,
      price: 15.7,
      image: ['assets/products/lorraine-tufted.png'],
      favourite: true,
      special: false,
      soldQuantity: 5,
      rating: 3.4,
      review: 40,
      discount: 10.0,
      productId: 'id1',
      productCategory: 'Chair',
      productTag: 'Chair furniture comfort'.split(' ')),
  ProductModel(
      productName: 'Brown Ergonomic Chair',
      description:
          'Ergonomic is any work-related item that was specifically designed for maximum comfort and efficiency. An ergonomic office chair is usually defined by having the following features:',
      color: ['yellow', 'blue', 'red', 'green'],
      quantity: 4,
      price: 15.7,
      image: ['assets/products/ergonomic.png'],
      favourite: true,
      special: false,
      soldQuantity: 5,
      rating: 3.4,
      review: 40,
      discount: 10.0,
      productId: 'id1',
      productCategory: 'Chair',
      productTag: 'Chair furniture comfort'.split(' ')),
  ProductModel(
      productName: 'Lorraine tufted',
      description:
          'Construction • Made of kiln-dried solid wood frame. • Crafted from solid wood for easy care, durability, and natural beauty. • Kiln-dried wood helps preven',
      color: ['yellow', 'blue', 'red', 'green'],
      quantity: 4,
      price: 15.7,
      image: ['assets/products/lorraine-tufted.png'],
      favourite: true,
      special: false,
      soldQuantity: 5,
      rating: 3.4,
      review: 40,
      discount: 10.0,
      productId: 'id1',
      productCategory: 'Chair',
      productTag: 'Chair furniture comfort'.split(' ')),
  ProductModel(
      productName: 'Brown Ergonomic Chair',
      description:
          'Ergonomic is any work-related item that was specifically designed for maximum comfort and efficiency. An ergonomic office chair is usually defined by having the following features:',
      color: ['yellow', 'blue', 'red', 'green'],
      quantity: 4,
      price: 15.7,
      image: ['assets/products/ergonomic.png'],
      favourite: true,
      special: false,
      soldQuantity: 5,
      rating: 3.4,
      review: 40,
      discount: 10.0,
      productId: 'id1',
      productCategory: 'Chair',
      productTag: 'Chair furniture comfort'.split(' ')),
];
