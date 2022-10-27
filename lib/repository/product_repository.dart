
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:funica/models/product_model.dart';

import 'package:funica/utils/small_widgets/snackbar.dart';


class ProductRespository {
//   pickImage(BuildContext context, ProductModel productModel) async {
//     final pickedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       String pic = await croppingImage(pickedImage, productModel);

//       cToast(msg: 'Profile Picture uploaded', context: context);
//     } else {
//       cToast(msg: 'Oops! failed', context: context);
//     }
//     return pic;
//   }

//   croppingImage(
//     pickedImage,
//     ProductModel products,
//   ) async {
//     print('cropping');
//     File? croppedFile = await ImageCropper().cropImage(
//       sourcePath: pickedImage.path,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       androidUiSettings: const AndroidUiSettings(
//           toolbarTitle: 'Crop to your taste',
//           toolbarColor: Colors.black,
//           statusBarColor: Colors.black,
//           toolbarWidgetColor: Colors.white,
//           activeControlsWidgetColor: Colors.black87,
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: false),
//       iosUiSettings: const IOSUiSettings(
//         minimumAspectRatio: 1.0,
//       ),
//     );
//     // return File(croppedFile!.path);
//     return uploadToStorage(
//       File(croppedFile!.path),
//       products,
//     );
//   }

//   String pic = '';
// // upload to firebase storage
  // Future<String> uploadToStorage(
  //   File image,
  //   ProductModel products,
  // ) async {
  //   print('storing photo');

  //   Reference ref = FirebaseStorage.instance
  //       .ref()
  //       .child('prOduct/${products.productCategory}')
  //       .child('${products.productId}');

  //   UploadTask uploadTask = ref.putFile(image);
  //   TaskSnapshot snap = await uploadTask;
  //   String downloadUrl = await snap.ref.getDownloadURL();
  //   String userId = FirebaseAuth.instance.currentUser!.uid.toString();
  //   products.image = downloadUrl;
  //   // await FirebaseFirestore.instance
  //   //     .collection('products')
  //   //     .doc(products.productCategory)
  //   //     .set({
  //   //   products.productId!: userId.toString(),
  //   // }, SetOptions(merge: true));
  //   // await FirebaseFirestore.instance
  //   //     .collection('products')
  //   //     .doc(products.productCategory)
  //   //     .set({
  //   //   "image": downloadUrl.toString(),
  //   // }, SetOptions(merge: true));
  //   return downloadUrl;
  // }
  

  Future<void> produtInfo(ProductModel products, BuildContext context) async {
    print('uploading product');
    final String id = FirebaseFirestore.instance
        .collection('products')
        .doc(products.productCategory)
        .collection(products.productCategory!)
        .doc()
        .id;
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(products.productCategory)
          .collection(products.productCategory!)
          .doc(id)
          .set({
        'productId': id,
        'productName': products.productName,
        'description': products.description,
        'color': products.color,
        'quantity': products.quantity,
        'price': products.price,
        'image': products.image,
        'soldQuantity': products.soldQuantity,
        'discount': products.discount,
        'productCategory': products.productCategory,
        'productTag': products.productTag,
      }, SetOptions(merge: true),);
      // print('product uploaded');
      cToast(
        context: context,
        msg: 'Something went wrong with your internet',
      );
      // print(e.message);
    } on FirebaseException catch (e) {
      cToast(msg: e.message.toString(), context: context);
    }
  }
}
