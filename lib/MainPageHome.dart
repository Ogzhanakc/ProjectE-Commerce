// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project3/Kategoriler.dart';
import 'package:project3/Sepetim.dart';
import 'package:project3/UrunInfo.dart';
import 'package:project3/constants.dart';
import 'AnaSayfa.dart';
import 'constants.dart';
import 'my_theme.dart';

class MainPageHome extends StatefulWidget {
  const MainPageHome({Key? key}) : super(key: key);

  @override
  State<MainPageHome> createState() => _MainPageHomeState();
}

class _MainPageHomeState extends State<MainPageHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: menu(),
        body: TabBarView(
          children: [

            Categories(),
            Sepetim(),
          ],
        ),
      ),
    );
  }
}

Widget menu() {
  return Container(

    child: TabBar(
      // labelColor: MyTheme().myThemeLight.primaryColor,
      // unselectedLabelColor: Colors.black,
      // indicatorSize: TabBarIndicatorSize.tab,
      // indicatorPadding: EdgeInsets.all(5.0),
      //indicatorColor: Colors.purple,
      tabs: [

        Tab(
          text: "Kategoriler",
          icon: Icon(Icons.category),
        ),
        Tab(
          text: "Sepetim",
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    ),
  );
}
