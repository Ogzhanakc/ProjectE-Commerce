import 'package:flutter/material.dart';
import 'package:project3/basket_card.dart';
import 'models/basket_model.dart';

class MyBasket extends StatefulWidget {
  // String? image;
  // String? productName;
  // String? price;
  // String? productCode;
  // String? quantity;
  List<BasketModel>? basketlist;



  static _MyBasketState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyBasketState>();

  @override
  State<MyBasket> createState() => _MyBasketState();
}

class _MyBasketState extends State<MyBasket> {
  List<BasketModel> products = [];

  @override


  @override
  Widget build(BuildContext context) {

    products.addAll(widget.basketlist!);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepetim"),
      ),
      body: widget.basketlist!.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                return BasketCard(
                    products[index].image,
                    products[index].productName,
                    products[index].price,
                    products[index].productCode,
                    products[index].quantity);
              },
              itemCount: products.length,
            )
          : Container(
              child: const Center(
                child: Text("SEPET BOŞ"),
              ),
            ),
    );
  }
}
