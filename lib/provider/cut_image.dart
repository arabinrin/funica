import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:remove_background/remove_background.dart';

// class CutImage with ChangeNotifier {
//   ui.Image? image;
//   bool isLoaded = false;
//   ByteData? pngBytes;

//   imageCutter(BuildContext context, ui.Image? image) async {
//     pngBytes = await cutImage(context: context, image: image!);
//     // setState(() {});
//   }

//   getUiImage() async {
//     ByteData data = await rootBundle.load('images/test_image.jpg');
//     image = await decodeImageFromList(data.buffer.asUint8List());
//     await getPNG();
//   }

//   getPNG() async {
//     pngBytes = await image?.toByteData(format: ui.ImageByteFormat.png);
//   }
// }
