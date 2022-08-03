import 'package:flutter/material.dart';
import 'package:project3/categories.dart';
import 'package:project3/models/products_model.dart';
import 'package:project3/product_card.dart';
import 'package:project3/products.dart';
import 'package:project3/take_data/take_data.dart';

class Products extends StatefulWidget {
  int? categoryId;


  Products({this.categoryId,});

  //static _ProductsState? of(BuildContext context) => context.findAncestorStateOfType<_ProductsState>();

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
              title: const Text("ürünler"),
            ),
      body: FutureBuilder<List<ProductsModel>>(
        future: TakeData()
            .getProducts(widget.categoryId.toString()),
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
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            );
          }
        },
      ),
    );
  }
}


//APPBAR
/*
Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            onSaved: (value) {
                              searchText = value ?? "";
                            },
                            decoration: InputDecoration(labelText: "Search..."),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              formKey.currentState?.save();
                            });
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Products()));
                          },
                          icon: Icon(Icons.send)),
                    ],
                  ),
                ),
 */