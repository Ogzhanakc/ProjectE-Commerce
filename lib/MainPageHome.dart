// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project3/add_comment.dart';
import 'package:project3/categories.dart';
import 'package:project3/basket.dart';
import 'package:project3/product_details.dart';
import 'package:project3/constants.dart';
import 'package:project3/products.dart';
import 'package:project3/profile.dart';
import 'main_page.dart';
import 'constants.dart';
import 'models/basket_model.dart';
import 'my_theme.dart';

class MainPageHome extends StatefulWidget {


  @override
  State<MainPageHome> createState() => _MainPageHomeState();
}

class _MainPageHomeState extends State<MainPageHome> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: menu(),
        body: TabBarView(
          children: [
            Categories(),
            MyBasket(),
            Profile(),
          ],
        ),
      ),
    );
  }
}

Widget menu() {
  return TabBar(
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
      Tab(
        text: "Profil",
        icon: Icon(Icons.person),
      ),
    ],
  );
}
