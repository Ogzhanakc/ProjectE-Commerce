// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project3/main.dart';
import 'UrunCard.dart';

class Categories extends StatefulWidget {
  //const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {


  @override

  Widget build(BuildContext context) {
    List<Widget> urunCardList = [
      UrunCard(),
      UrunCard(),
      UrunCard(),
    ];
    urunCardList.add(UrunCard());
    urunCardList.add(UrunCard());

    return Scaffold(
      appBar: AppBar(
        title: Text("Kategoriler"),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     setState((){
          //
          //     });
          //   },
          //   icon: Icon(Icons.search),
          // ),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Scaffold(
        appBar: AppBar(
          title: Text("Tüm Kategoriler"),
        ),
        body: GridView.count(
          padding: EdgeInsets.all(10),
          mainAxisSpacing: 30,
          crossAxisSpacing: 20,
          crossAxisCount: 2,
          children: [
            for(int i=0; i < urunCardList.length;i++)
              urunCardList[i],

          ],
        ),
      ),
    );
  }
}
