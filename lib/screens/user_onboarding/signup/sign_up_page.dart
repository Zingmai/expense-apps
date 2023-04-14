import 'package:flutter/material.dart';

import '../../../custom_widgets/custom_logo_widget.dart';
import '../../../custom_widgets/custom_rounded_btn.dart';
import '../../../custom_widgets/custom_text_field.dart';
import '../../../ui_helper/ui_helper.dart';
import '../../home/home_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var nameController= TextEditingController();
  var emailController = TextEditingController();
  var phoneController=TextEditingController();
  var passController = TextEditingController();
  var confirmPassController=TextEditingController();
  var isLight;

  var height;
  var width;

  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness == Brightness.light;
    height = MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: MediaQuery.of(context).orientation==Orientation.portrait? portraitUI():landScapeUI(),

    );
  }
  Widget mainUI() {
    return LayoutBuilder(
      builder:(context,constraints){
        print(constraints.maxWidth);
        print(constraints.maxHeight);
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomLogoWidget(msize: constraints.maxWidth>620?50:34,bgColor: Theme.of(context).canvasColor,iconColor: Theme.of(context).backgroundColor),
                SizedBox(
                  height: 21,
                ),
                Text(
                  'New Here?',
                  style: constraints.maxWidth>620? mTextStyle52(fontWeight: FontWeight.w900,
                      mColor: isLight ? MyColor.textBColor : MyColor.textWColor)
                      :mTextStyle34(fontWeight: FontWeight.w900,
                      mColor: isLight ? MyColor.textBColor : MyColor.textWColor),

                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  'Create an account',
                  style:constraints.maxWidth>620?
                  mTextStyle25(
                      mColor: isLight
                          ? MyColor.secondaryBColor
                          : MyColor.secondaryWColor):
                  mTextStyle16(
                      mColor: isLight
                          ? MyColor.secondaryBColor
                          : MyColor.secondaryWColor),
                ),

                //////////////////////Input field///////////
                SizedBox(
                  height: 21,
                ),
                CustomTextField(
                    mIcon: Icons.drive_file_rename_outline,
                    fillColor:
                    isLight ? MyColor.secondaryWColor : MyColor.secondaryBColor,
                    controller: nameController,
                    borderColor: isLight ? MyColor.bgBColor : MyColor.bgWColor),
                SizedBox(
                  height: 11,
                ),
                CustomTextField(
                    mIcon: Icons.email_outlined,
                    fillColor:
                    isLight ? MyColor.secondaryWColor : MyColor.secondaryBColor,
                    controller: emailController,
                    borderColor: isLight ? MyColor.bgBColor : MyColor.bgWColor),
                SizedBox(
                  height: 11,
                ),
                CustomTextField(
                    mIcon: Icons.phone,
                    fillColor:
                    isLight ? MyColor.secondaryWColor : MyColor.secondaryBColor,
                    controller: phoneController,
                    borderColor: isLight ? MyColor.bgBColor : MyColor.bgWColor),
                SizedBox(
                  height: 11,
                ),

                CustomTextField(
                    mIcon: Icons.lock_outline,
                    fillColor:
                    isLight ? MyColor.secondaryWColor : MyColor.secondaryBColor,
                    controller: passController,
                    borderColor: isLight ? MyColor.bgBColor : MyColor.bgWColor),
                SizedBox(
                  height: 11,
                ),
                CustomTextField(
                    mIcon: Icons.lock_outline,
                    fillColor:
                    isLight ? MyColor.secondaryWColor : MyColor.secondaryBColor,
                    controller: confirmPassController,
                    borderColor: isLight ? MyColor.bgBColor : MyColor.bgWColor),
                SizedBox(
                  height: 11,
                ),

                ///////////////////Footer//////////////////
                CustomRoundedBtn(
                  title: 'Sign-up',
                  action: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                  },
                  mWidth: double.infinity,
                  mColor: isLight ? MyColor.bgBColor : MyColor.bgWColor,
                  textColor: isLight ? MyColor.bgWColor : MyColor.bgBColor,
                ),
                /*SizedBox(
                  height: 11,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create a new Account?',
                      style: constraints.maxWidth>620?
                      mTextStyle16(
                          mColor: isLight
                              ? MyColor.secondaryBColor
                              : MyColor.secondaryWColor):
                      mTextStyle12(
                          mColor: isLight
                              ? MyColor.secondaryBColor
                              : MyColor.secondaryWColor),
                    ),
                    TextButton(onPressed: () {

                    }, child: Text(
                      'Sign-Up now',
                      style: constraints.maxWidth>620?
                      mTextStyle16(
                          fontWeight: FontWeight.w900,
                          mColor: isLight
                              ? MyColor.bgBColor
                              : MyColor.bgWColor):
                      mTextStyle12(
                          fontWeight: FontWeight.w900,
                          mColor: isLight
                              ? MyColor.bgBColor
                              : MyColor.bgWColor),
                    ),)
                  ],
                )*/
              ],
            ),
          ),
        );
      } ,

    );
  }
  Widget landScapeUI(){
    return Row(
      children: [
        Expanded(child: Container(
          color: isLight?MyColor.secondaryBColor:MyColor.secondaryWColor,
          child: Center(
            child: CustomLogoWidget(msize: 70,bgColor: Theme.of(context).backgroundColor,iconColor: Theme.of(context).canvasColor),
          ),
        )),
        Expanded(child: height > 600
            ? mainUI()
            : SingleChildScrollView(
          child: mainUI(),
        ),)
      ],
    );

  }
  Widget portraitUI(){
    return height > 600
        ? mainUI()
        : SingleChildScrollView(
      child: mainUI(),
    );

  }
}
