import 'dart:convert';

ProductsModel productsModelFromMap(String str) => ProductsModel.fromMap(json.decode(str));

String productsModelToMap(ProductsModel data) => json.encode(data.toMap());

class ProductsModel {
  ProductsModel({
    required this.id,
    required this.productCode,
    required this.productName,
    required this.sortDescription,
    required this.price,
    required this.image,
  });

  final String id;
  final String productCode;
  final String productName;
  final String sortDescription;
  final String price;
  final String image;

  factory ProductsModel.fromMap(Map<String, dynamic> json) => ProductsModel(
    id: json["id"],
    productCode: json["product_code"],
    productName: json["product_name"],
    sortDescription: json["sort_description"],
    price: json["price"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_code": productCode,
    "product_name": productName,
    "sort_description": sortDescription,
    "price": price,
    "image": image,
  };
}
