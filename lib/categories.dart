// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project3/category_card.dart';

import 'package:project3/models/categories_model.dart';
import 'package:project3/take_data/take_data.dart';
import 'product_card.dart';

class Categories extends StatefulWidget {
  //const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Kategoriler"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
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
        body: FutureBuilder<List<CategoriesModel>>(
          future: TakeData().getCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var categoryList = snapshot.data!;

              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                  ),
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    var category = categoryList[index];
                    return CategoryCard(
                        image: category.categoryId.toString(),
                        name: category.name,
                    categoryId: category.categoryId);
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              ));
            }
          },
        ),
      ),
    );
  }
}