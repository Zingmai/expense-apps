import 'package:flutter/material.dart';
class CustomLogoWidget extends StatelessWidget {
  double msize;
  Color bgColor;
  Color iconColor;
  CustomLogoWidget({required this.msize,required this.bgColor,required this.iconColor});

  @override
  Widget build(BuildContext context) {

    return CircleAvatar(
      backgroundColor: bgColor,
      radius:  msize,
      child: ImageIcon(AssetImage('assets/images/expenses2.png'),color: iconColor,size: msize,),

    );
  }
}
