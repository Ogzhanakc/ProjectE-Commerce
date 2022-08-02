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
  // List<BasketModel>? basketList;

  //MainPageHome({this.basketList});

  static _MainPageHomeState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MainPageHomeState>();

  @override
  State<MainPageHome> createState() => _MainPageHomeState();
}

class _MainPageHomeState extends State<MainPageHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: menu(sendBasket),
        body: TabBarView(
          children: [
            Categories(), //   BOŞDEĞİLSE---BOŞSA
            MyBasket(),
            Profile(),
          ],
        ),
      ),
    );
  }
}

Widget menu(List basketList) {
  return TabBar(
    tabs: [
      Tab(
        text: "Kategoriler",
        icon: Icon(Icons.category),
      ),
      Tab(
          text: "Sepetim",
          icon: basketList.isNotEmpty
              ? Stack(
                  children: const [
                    Icon(Icons.shopping_cart_outlined),
                    Positioned(
                      left: 15.0,
                      child: Icon(
                        Icons.brightness_1,
                        size: 10.0,
                        color: Colors.red,
                      ),
                    )
                  ],
                )
              : Icon(Icons.shopping_cart_outlined)),
      Tab(
        text: "Profil",
        icon: Icon(Icons.person),
      ),
    ],
  );
}
