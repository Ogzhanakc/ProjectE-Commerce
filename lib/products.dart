import 'package:flutter/material.dart';
import 'package:project3/models/products_model.dart';
import 'package:project3/product_card.dart';
import 'package:project3/take_data/take_data.dart';

class Products extends StatefulWidget {
  late int categoryId;


  Products({required this.categoryId});

  //static _ProductsState? of(BuildContext context) => context.findAncestorStateOfType<_ProductsState>();

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
String searchText ="";
late final Future<List<ProductsModel>> _fillList;
@override
  void initState() {
    super.initState();
    _fillList = TakeData().getProducts(widget.categoryId.toString(), searchText);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ürünler"),
      ),
      body: FutureBuilder<List<ProductsModel>>(
        future: _fillList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var productList = snapshot.data!;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  var products = productList[index];

                  return ProductCard(
                    productName: products.productName,
                    image: products.image,
                    price: products.price,
                    productCode: products.productCode,
                    sortDescription: products.sortDescription,
                  );
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
