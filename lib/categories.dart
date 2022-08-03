// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project3/category_card.dart';

import 'package:project3/models/categories_model.dart';
import 'package:project3/products.dart';
import 'package:project3/search_page.dart';
import 'package:project3/take_data/take_data.dart';

bool searchPressed = false;

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  late final Future<List<CategoriesModel>> _fillList;
  @override
  void initState() {
    super.initState();
    _fillList = TakeData().getCategories();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategoriler"),
        actions: [
          IconButton(
            onPressed: () {
                setState((){
                  searchPressed = true;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage()),);
                });
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<List<CategoriesModel>>(
        future: _fillList,
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
            ));
          }
        },
      ),
    );
  }
}
