import 'dart:convert';

CategoriesModel categoriesModelFromMap(String str) => CategoriesModel.fromMap(json.decode(str));

String categoriesModelToMap(CategoriesModel data) => json.encode(data.toMap());

class CategoriesModel {
  CategoriesModel({
    required this.categoryId,
    required this.parentId,
    required this.name,
    required this.image,
    required this.filterValue,
  });

  final int categoryId;
  final int parentId;
  final String name;
  final String image;
  final String filterValue;

  factory CategoriesModel.fromMap(Map<String, dynamic> json) => CategoriesModel(
    categoryId: json["category_id"],
    parentId: json["parent_id"],
    name: json["name"],
    image: json["image"],
    filterValue: json["filter_value"],
  );

  Map<String, dynamic> toMap() => {
    "category_id": categoryId,
    "parent_id": parentId,
    "name": name,
    "image": image,
    "filter_value": filterValue,
  };
}
