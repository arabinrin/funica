import 'dart:io';

import 'package:chip_list/chip_list.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/models/category_model.dart';
import 'package:funica/models/product_model.dart';
import 'package:funica/repository/product_repository.dart';
import 'package:funica/repository/storage_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:funica/repository/database.dart';
import 'package:funica/repository/profile_repository.dart';
import 'package:funica/utils/small_widgets/arrow.dart';
import 'package:funica/utils/small_widgets/snackbar.dart';
import 'package:funica/utils/small_widgets/svg.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:funica/widgets/button.dart';
import 'package:funica/widgets/custom_textfield.dart';
import 'package:funica/widgets/selector.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({Key? key}) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _tagFocusNode = FocusNode();

  DatabaseMethods databaseMethods = DatabaseMethods();
  TextEditingController productName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController productTag = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController productCategory = TextEditingController();
  TextEditingController soldQuantity = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController priceController = TextEditingController();
  List<String>? colorList = [];
  List<String> colorToPick = ['pink', 'yellow', 'green', 'blue'];
  String dropdownvalue = 'Choose Category';
  final formrepository = ProfileRespository();

  final productrepository = ProductRespository();
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  List<String?> _selectedFiles = [];
  late Storaged storage;
  List<XFile> filesPath = [];

  List<String> _values = [];
  clear() {
    productName.clear();
    description.clear();
    productTag.clear();
    quantity.clear();
    productCategory.clear();
    soldQuantity.clear();
    discount.clear();
    priceController.clear();
    colorList!.clear();
  }

  _onPressedModifyTextField() {
    final text = _values.toString();
    productTag.text = text;
    productTag.value = productTag.value.copyWith(
      text: text,
      selection: TextSelection(
        baseOffset: text.length,
        extentOffset: text.length,
      ),
    );
  }

  _onDelete(int index) {
    setState(() {
      _values.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    storage = Provider.of<Storaged>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final color = Theme.of(context);
    int intFromString = quantity.text.isNotEmpty ? int.parse(quantity.text) : 0;
    double priceInDouble = priceController.text.isNotEmpty
        ? double.parse(priceController.text)
        : 0.0;
    int intQuantitysold =
        soldQuantity.text.isNotEmpty ? int.parse(soldQuantity.text) : 0;
    double discountInDouble =
        discount.text.isNotEmpty ? double.parse(discount.text) : 0.0;

    return SafeArea(
      child: Scaffold(
          body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                const ArrowBack(),
                Text(
                  'Add new product',
                  style: GoogleFonts.poppins(
                      textStyle: bodyNormalBoldText(context)),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Form(
                key: _formKey,
                child: Column(children: [
                  // InkWell(
                  //   onTap: () async {
                  //     setState(() {});
                  //   },
                  //   child: SizedBox(
                  //     height: 150.h,
                  //     width: 150.h,
                  //     child: Stack(
                  //       children: [
                  //         Container(
                  //           height: 150.h,
                  //           width: 150.h,
                  //           decoration: BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             color: color.hoverColor,
                  //           ),
                  //           child: ClipOval(
                  //             child: CachedNetworkImage(
                  //               fit: BoxFit.cover,
                  //               imageUrl: pic != null ? pic! : '',
                  //               placeholder: (context, url) => SvgImage(
                  //                   name: 'assets/svgs/profile.svg',
                  //                   height: 150.h,
                  //                   width: 150.w),
                  //               errorWidget: (context, url, error) => SvgImage(
                  //                   name: 'assets/svgs/profile.svg',
                  //                   height: 150.h,
                  //                   width: 150.w),
                  //             ),
                  //           ),
                  //         ),
                  //         Positioned(
                  //             right: 10.w,
                  //             bottom: 10,
                  //             child: const Icon(Icons.camera_enhance)),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          final results = await FilePicker.platform.pickFiles(
                            allowMultiple: true,
                            type: FileType.custom,
                            allowedExtensions: ['png', 'jpg'],
                          );
                          for (var image in results!.paths) {
                            final f = File(image!);
                            int sizeInBytes = f.lengthSync();
                            double sizeInMb = sizeInBytes / (1024 * 1024);
                            if (sizeInMb > 5) {
                              cToast(
                                  msg: "Pictures shouldn\'t exceed 5MB",
                                  context: context);
                            } 
                          }
                          // if (results == null) {
                          //   cToast(
                          //       msg: "No file selected.",
                          //       color: kErrorColor,
                          //       context: context);
                          // }
                          // loadSelectedFile(results!.files);
                          setState(() {
                            // _selectedFiles = results.paths;
                            _selectedFiles.addAll(results.paths);
                          });
                          filesPath = results.paths
                              .map((path) => XFile(path!))
                              .toList();
                          // List filesName = results.names.map((path) => File(path!)).toList();
                          storage
                              .uploadFile(filesPath)
                              .then((value) => print("Done uploading"));
                        },
                        child: Container(
                          padding: EdgeInsets.all(12.r),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: SvgImage(
                              name: 'assets/svgs/profile.svg',
                              height: 150.h,
                              width: 150.w),
                        ),
                      ),
                      Text(
                        "Add photos",
                        style: bodySmallText(context)
                            .copyWith(color: color.primaryColor, fontSize: 14),
                      )
                    ],
                  ),
                  CustomFormField(
                      controller: productName,
                      keyboardType: TextInputType.name,
                      inputAction: TextInputAction.done,
                      label: '',
                      hint: 'Product name'),
                  CustomFormField(
                      controller: description,
                      keyboardType: TextInputType.name,
                      inputAction: TextInputAction.done,
                      label: '',
                      hint: 'Description'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * .4,
                        child: CustomFormField(
                            controller: discount,
                            keyboardType: TextInputType.number,
                            inputAction: TextInputAction.done,
                            label: '',
                            hint: 'discount'),
                      ),
                      SizedBox(
                        width: width * .4,
                        child: CustomFormField(
                            controller: soldQuantity,
                            keyboardType: TextInputType.number,
                            inputAction: TextInputAction.done,
                            label: '',
                            hint: 'sold quantity'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * .4,
                        child: CustomFormField(
                            controller: priceController,
                            keyboardType: TextInputType.number,
                            inputAction: TextInputAction.done,
                            label: '',
                            hint: 'Price'),
                      ),
                      SizedBox(
                        height: 60,
                        width: width * .4,
                        child: CustomFormField(
                          controller: soldQuantity,
                          keyboardType: TextInputType.datetime,
                          inputAction: TextInputAction.done,
                          label: '',
                          hint: 'sold',
                        ),
                      ),
                    ],
                  ),
                  //  const CustomFormField(
                  //     readOnly: true,
                  //     keyboardType: TextInputType.name,
                  //     inputAction: TextInputAction.done,
                  //     label: '',
                  //     hint: 'Color',
                  //     // sufIcon: InkWell(
                  //     //     onTap: () {
                  //     //       showModalBottomSheet(
                  //     //         context: context,
                  //     //         shape: const RoundedRectangleBorder(
                  //     //             borderRadius: BorderRadius.only(
                  //     //           topRight: Radius.circular(16),
                  //     //           topLeft: Radius.circular(16),
                  //     //         )),
                  //     //         builder: (BuildContext context) {
                  //     //           return
                  //     //         },
                  //     //       );
                  //     //     },
                  //     //     child: const Icon(Icons.arrow_drop_down)),
                  //   ),
                  ChipList(
                    extraOnToggle: ((index) {
                      colorList!.add(colorToPick[index]);
                    }),
                    listOfChipNames: colorss,
                    supportsMultiSelect: true,
                    activeBgColorList: [
                      Colors.pink,
                      Colors.yellow,
                      Colors.green,
                      Colors.pink,
                    ],
                    inactiveBgColorList: [color.primaryColor],
                    activeTextColorList: [color.backgroundColor],
                    inactiveTextColorList: [Theme.of(context).primaryColor],
                    listOfChipIndicesCurrentlySeclected: [],
                  ),

                  // CustomFormField(
                  //     controller: productTag,
                  //     keyboardType: TextInputType.emailAddress,
                  //     inputAction: TextInputAction.done,
                  //     label: '',
                  //     sufIcon: const Icon(Icons.tag),
                  //   hint: 'product Tag'),
                  CustomFormField(
                    readOnly: true,
                    controller: productCategory,
                    keyboardType: TextInputType.name,
                    inputAction: TextInputAction.done,
                    label: '',
                    sufIcon: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                              )),
                              builder: (BuildContext context) =>
                                  DynamicSelector(
                                      header: 'Choose product category',
                                      list: categoryNames)).then((value) {
                            // print(value);
                            setState(() {
                              productCategory.text = value.toString();
                            });
                          });
                        },
                        child: const Icon(Icons.arrow_drop_down)),
                    hint: 'Category',
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6.h),
                    decoration: BoxDecoration(
                      color: color.hoverColor,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                  ),
                  SizedBox(
                    height: 120.h,
                    width: width,
                    child: TagEditor(
                      maxLines: 3,
                      length: _values.length,
                      controller: productTag,
                      focusNode: _tagFocusNode,
                      delimiters: const [',', ' '],
                      hasAddButton: true,
                      resetTextOnSubmitted: false,
                      // This is set to grey just to illustrate the `textStyle` prop
                      textStyle: const TextStyle(color: Colors.grey),
                      onSubmitted: (outstandingValue) {
                        setState(() {
                          _values.add(outstandingValue);
                          
                        });
                      },
                      inputDecoration: InputDecoration(
                        fillColor: color.backgroundColor,
                        border: InputBorder.none,
                        hintText: 'Use  tags ',
                      ),
                      onTagChanged: (newValue) {
                        setState(() {
                          _values.add(newValue);
                          _onPressedModifyTextField;
                        });
                      },
                      tagBuilder: (context, index) => _Chip(
                        index: index,
                        label: _values[index],
                        onDeleted: _onDelete,
                      ),
                      // InputFormatters example, this disallow \ and /
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // This is just a button to illustrate how to use
                  // TextEditingController to set the value
                  // or do whatever you want with it

                  if (loading)
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: LoadingIndicator(
                          indicatorType: Indicator.ballSpinFadeLoader,
                          colors: [
                            color.primaryColor,
                            Colors.grey,
                            color.primaryColor.withOpacity(.5),
                          ],
                          strokeWidth: 4,
                          pathBackgroundColor: color.primaryColor),
                    ),
                  if (!loading)
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          ProductModel productModel = ProductModel(
                            productName: productName.text,
                            description: description.text,
                            color: colorList,
                            quantity: intFromString,
                            price: priceInDouble,
                            image: storage.getImagePath,
                            soldQuantity: intQuantitysold,
                            // productId: '${DateTime.now()}+${productName.text}',
                            productCategory: productCategory.text,
                            productTag: _values,
                            discount: discountInDouble,
                          );
                          print(productModel.productTag);
                          print(productModel.color);
                          print(productModel.image);

                          await productrepository.produtInfo(
                              productModel, context);
                          clear();
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                      child: Button(
                          title: 'Update product',
                          color: color.primaryColor,
                          textcolor: color.backgroundColor),
                    )
                ]))
          ]),
        ),
      )),
    );
  }
}

List<String> colorss = const ['pink', 'yellow', 'green', 'blue'];

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
