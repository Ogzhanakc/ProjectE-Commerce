// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project3/categories.dart';
import 'package:project3/my_theme.dart';

import 'MainPageHome.dart';
import 'constants.dart';
import 'models/basket_model.dart';
import 'product_details.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {

  static _MainPageState? of(BuildContext context) => context.findAncestorStateOfType<_MainPageState>();
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool darkThemeBool = false;
  void switcher(){
    setState((){
      darkThemeBool = !darkThemeBool;
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkThemeBool ?  MyTheme().myThemeDark : MyTheme().myThemeLight,
      debugShowCheckedModeBanner: false,
      home: MainPageHome(),
    );
  }
}
