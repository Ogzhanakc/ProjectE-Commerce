import 'package:flutter/material.dart';
import 'package:project3/basket_card.dart';
import 'package:project3/product_details.dart';
import 'models/basket_model.dart';

class MyBasket extends StatefulWidget {
  static _MyBasketState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyBasketState>();

  @override
  State<MyBasket> createState() => _MyBasketState();
}

class _MyBasketState extends State<MyBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepetim"),
      ),
      body: sendBasket.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                return BasketCard(
                  sendBasket[index].image,
                  sendBasket[index].productName,
                  sendBasket[index].price,
                  sendBasket[index].productCode,
                  sendBasket[index].quantity,
                  index,
                );
              },
              itemCount: sendBasket.length,
            )
          : Container(
              child: const Center(
                child: Text("SEPET BOŞ"),
              ),
            ),
    );
  }
}
