import 'package:flutter/material.dart';
import 'package:project3/basket.dart';
import 'package:project3/main.dart';
import 'package:project3/product_details.dart';

import 'models/basket_model.dart';

class BasketCard extends StatefulWidget {
  String? image;
  String? productName;
  String? price;
  String? productCode;
  String? quantity;
  int index;


  BasketCard(this.image, this.productName, this.price, this.productCode,
      this.quantity, this.index, );

  @override
  State<BasketCard> createState() => _BasketCardState();
}

class _BasketCardState extends State<BasketCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Image.network(widget.image!),
            title: Text(
              widget.productName!,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text((double.parse(widget.price!.split(" ").first.replaceFirst(",", ""))*(int.parse(widget.quantity!))).toString()),
            trailing: Text(widget.quantity!.toString()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                child: const Text("Sil"),
                onPressed: () {
                  sendBasket.removeAt(widget.index);
                  print("Delete Succesful");
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MainPage()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
