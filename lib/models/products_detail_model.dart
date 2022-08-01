import 'dart:convert';

ProductsDetailsModel productsDetailsModelFromMap(String str) => ProductsDetailsModel.fromMap(json.decode(str));

String productsDetailsModelToMap(ProductsDetailsModel data) => json.encode(data.toMap());

class ProductsDetailsModel {
  ProductsDetailsModel({
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

  factory ProductsDetailsModel.fromMap(Map<String, dynamic> json) => ProductsDetailsModel(
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
