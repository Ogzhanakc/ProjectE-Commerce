import 'package:flutter/material.dart';

class BasketCard extends StatefulWidget {
  String? image;
  String? productName;
  String? price;
  String? productCode;
  String? quantity;

  BasketCard(this.image, this.productName, this.price, this.productCode,
      this.quantity);

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
            title: Text(widget.productName!),
            subtitle: Text(widget.price!),
            trailing: Text(widget.quantity!.toString()),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: <Widget>[
          //     TextButton(
          //       child: const Text("Sil"),
          //       onPressed: () {},
          //     ),
          //     const SizedBox(width: 8),
          //     TextButton(
          //       child: const Text('Satın Al'),
          //       onPressed: () {},
          //     ),
          //     const SizedBox(width: 8),
          //   ],
          // ),
        ],
      ),
    );
  }
}
