import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:funica/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> specialProducts = [];

  // Future<List<ProductModel>>
  specialOffer() async {
    List<String> category =
        'Sofa Chairs Table Kitchen lamp Cupboard Vase Others'.split(' ');
    for (int i = 0; i < category.length; i++) {
      print('${category[i]}');
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(category[i])
          .collection(category[i])
          .where('special', isEqualTo: true)
          .get();
      print('${querySnapshot.docs}');
      List<ProductModel> products = querySnapshot.docs
          .map((QueryDocumentSnapshot<Object?> e) => ProductModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();

      print('$products');
      specialProducts..addAll(products);
    }
    print(specialProducts);
    notifyListeners();
  }
}
