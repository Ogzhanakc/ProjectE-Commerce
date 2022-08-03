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

          child: Column(
            children: [
              Expanded(
                  child: CircleAvatar(backgroundImage: AssetImage("images/categories/${image!}.jpg",),radius: 100,)),
              Text(name!,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal),),
            ],
          )),
    );
  }
}
