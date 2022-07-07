// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project3/Kategoriler.dart';
import 'package:project3/my_theme.dart';
import 'MainPageHome.dart';
import 'constants.dart';
import 'UrunInfo.dart';

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
      theme: light == true ? MyTheme().myThemeLight : MyTheme().myThemeDark,
      debugShowCheckedModeBanner: false,
      home: MainPageHome(),
    );
  }
}
