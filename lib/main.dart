// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project3/categories.dart';
import 'package:project3/my_theme.dart';
import 'MainPageHome.dart';
import 'constants.dart';
import 'product_details.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:MyTheme().myThemeLight,
      debugShowCheckedModeBanner: false,
      home: MainPageHome(),
    );
  }
}
