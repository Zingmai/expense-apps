import 'package:expense/screens/splash/splash_page.dart';
import 'package:expense/ui_helper/ui_helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
          primarySwatch: createMaterialColor(MyColor.bgBColor),
          backgroundColor: MyColor.bgBColor,
          canvasColor: MyColor.bgWColor
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: createMaterialColor(MyColor.bgWColor),
        backgroundColor: MyColor.bgWColor,
        canvasColor: MyColor.bgBColor
      ),
      home:  SplashPage(),
    );
  }
}
