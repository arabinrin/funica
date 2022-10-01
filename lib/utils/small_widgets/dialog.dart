import 'package:flutter/material.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';

void showSuccessDialog(
    {required BuildContext context,
    required String header,
    required String body,
    required String path}) {
  showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      final color = Theme.of(context);

      return AlertDialog(
        backgroundColor: color.backgroundColor,
        content: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                 
                  Text(
                    header,
                    textAlign: TextAlign.center,
                    style:
                        bodyNormalText(context).copyWith(color: color.primaryColor),
                  ),
                 const  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: color.hintColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        body,
                        style: bodySmallText(context),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Colors.black,
                      size: 30,
                    ),
                  ))
            ],
          ),
        ),
      );
    },
  );
}
