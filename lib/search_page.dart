import 'package:flutter/material.dart';

import 'package:project3/product_card.dart';
import 'package:project3/take_data/take_data.dart';
import 'models/products_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Search Page",
      )),
      body: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Expanded(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            onSaved: (value) {
                              searchText = value ?? "";
                            },
                            decoration: InputDecoration(labelText: "Search...",),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              formKey.currentState?.save();
                              FocusManager.instance.primaryFocus?.unfocus();
                            });
                          },
                          icon: Icon(Icons.search)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: FutureBuilder<List<ProductsModel>>(
          future: TakeData().getSearchProducts(),
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
      ),
    );
  }
}
/*
Center(
          child: Column(
            children: [
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
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    searchPressed = !searchPressed;
                    formKey.currentState?.save();
                  });
                },
                child: Text("Search"),
              ),
            ],
          ),
        )
 */
/*
FutureBuilder<List<ProductsModel>>(
        future: TakeData().getSearchProducts(),
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
 */
