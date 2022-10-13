class ProductModel {
  final String? productName;
  final String? description;
  final List<String>? color;
  final int? quantity;
  final double? price;
  final String? image;
  final bool? favourite;
  final bool? wishlist;
  final int? soldQuantity;
  final int? review;
  final double? rating;
  final double? discount;
  final String? userId;
  final String? productCategory;
  final String? productTag;

  ProductModel({
    this.productName,
    this.description,
    this.color,
    this.quantity,
    this.price,
    this.image,
    this.favourite,
    this.wishlist,
    this.soldQuantity,
    this.rating,
    this.review,
    this.discount,
    this.userId,
    this.productCategory,
    this.productTag,
  });
}

List<ProductModel> products = [
  ProductModel(
      productName: 'Brown Ergonomic Chair',
      description:
          'Ergonomic is any work-related item that was specifically designed for maximum comfort and efficiency. An ergonomic office chair is usually defined by having the following features:',
      color: ['yellow', 'blue', 'red', 'green'],
      quantity: 4,
      price: 15.7,
      image: 'assets/products/lorraine-tufted.png',
      favourite: true,
      wishlist: false,
      soldQuantity: 5,
      rating: 3.4,
      review: 40,
      discount: 10.0,
      userId: 'id1',
      productCategory: 'Chair',
      productTag: 'Chair furniture comfort'),
  ProductModel(
      productName: 'Brown Ergonomic Chair',
      description:
          'Ergonomic is any work-related item that was specifically designed for maximum comfort and efficiency. An ergonomic office chair is usually defined by having the following features:',
      color: ['yellow', 'blue', 'red', 'green'],
      quantity: 4,
      price: 15.7,
      image: 'assets/products/ergonomic.png',
      favourite: true,
      wishlist: false,
      soldQuantity: 5,
      rating: 3.4,
      review: 40,
      discount: 10.0,
      userId: 'id1',
      productCategory: 'Chair',
      productTag: 'Chair furniture comfort'),
  ProductModel(
      productName: 'Lorraine tufted',
      description:
          'Construction • Made of kiln-dried solid wood frame. • Crafted from solid wood for easy care, durability, and natural beauty. • Kiln-dried wood helps preven',
      color: ['yellow', 'blue', 'red', 'green'],
      quantity: 4,
      price: 15.7,
      image: 'assets/products/lorraine-tufted.png',
      favourite: true,
      wishlist: false,
      soldQuantity: 5,
      rating: 3.4,
      review: 40,
      discount: 10.0,
      userId: 'id1',
      productCategory: 'Chair',
      productTag: 'Chair furniture comfort'),
  ProductModel(
      productName: 'Brown Ergonomic Chair',
      description:
          'Ergonomic is any work-related item that was specifically designed for maximum comfort and efficiency. An ergonomic office chair is usually defined by having the following features:',
      color: ['yellow', 'blue', 'red', 'green'],
      quantity: 4,
      price: 15.7,
      image: 'assets/products/ergonomic.png',
      favourite: true,
      wishlist: false,
      soldQuantity: 5,
      rating: 3.4,
      review: 40,
      discount: 10.0,
      userId: 'id1',
      productCategory: 'Chair',
      productTag: 'Chair furniture comfort'),
];
