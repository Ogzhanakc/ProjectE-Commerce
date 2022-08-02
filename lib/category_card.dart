import 'package:flutter/material.dart';
import 'package:project3/products.dart';

class CategoryCard extends StatelessWidget {
  String? image;
  String? name;
  int? categoryId;

  CategoryCard({required this.image, required this.name,required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Products(categoryId: categoryId!)));
      },
      //Burada resimlerin şekli textin şekli ile oyna
      child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                      child:
                          Image.asset("images/categories/" + image! + ".jpg"))),
              Text(name!),
            ],
          )),
    );
  }
}
