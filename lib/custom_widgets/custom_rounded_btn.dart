import 'package:expense/ui_helper/ui_helper.dart';
import 'package:flutter/material.dart';

class CustomRoundedBtn extends StatelessWidget {
  var title;
  VoidCallback action;
  var mWidth;
  Color mColor;
  Color textColor;

  CustomRoundedBtn(
      {required this.title,
      required this.action,
      required this.mWidth,
      required this.mColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: mWidth,
        height: 60,
        child: ElevatedButton(
          onPressed: action,
          style: ElevatedButton.styleFrom(
              primary: mColor,shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11)
          )),
          child: Text(title,style: mTextStyle25(mColor: textColor),),
        ));
  }
}
