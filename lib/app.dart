import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/app/pages/home_page.dart';
import 'package:pets/others/resources/fonts.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: CFonts.regular
      ),
      home: HomePage(),
    );
  }
}
