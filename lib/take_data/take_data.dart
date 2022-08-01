import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project3/models/categories_model.dart';
import 'package:project3/models/products_detail_model.dart';
import 'package:project3/models/products_model.dart';

class TakeData {
  Future<List<CategoriesModel>> getCategories() async {
    var response = await http
        .get(Uri.parse("https://b2bdemo.mrpyazilim.com/api/get_categories"));
    var categoriesJsonData = jsonDecode(response.body);
    List<CategoriesModel> categories = (categoriesJsonData as List)
        .map((categoriesMap) => CategoriesModel.fromMap(categoriesMap))
        .toList();
    return categories;
  }

  Future<List<ProductsModel>> getProducts(String category) async {
    Map<String, dynamic> map = {
      "category": category,
      "order_by": "desc",
    };
    Uri uri = Uri.parse(
        "https://b2bdemo.mrpyazilim.com/api/get_products?token=MTk5MzMxODM1MDYyY2ZlM2ZlNzkxNDc1LjUyODA1NTk2");
    //burada map i yollayarak response ediyor
    final response = await http.post(uri, body: jsonEncode(map));
    //Başarılı olup olmadığını kontrol ediyor
    if (response.statusCode == 200) {
      //burda veriyi alıyor
      var productsJsonData = jsonDecode(response.body);
      //burada parse işlemi yapılıyor
      List<ProductsModel> products = (productsJsonData["products"] as List)
          .map<ProductsModel>((json) => ProductsModel.fromMap(json))
          .toList();

      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }


}
