// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project3/product_details.dart';

class ProductCard extends StatefulWidget {
  String? productName;
  String? image;
  String? price;
  String? productCode;
  String? sortDescription;

  ProductCard(
      {required this.productName,
      required this.image,
      required this.price,
      required this.productCode,
      required this.sortDescription});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetail(
                productName: widget.productName,
                image: widget.image,
                price: widget.price,
                productCode: widget.productCode,
                sortDescription: widget.sortDescription)));
      },
      child: Container(
        decoration: BoxDecoration(

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                widget.image!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(widget.productName!,overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.price!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

/*
 Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UrunInfo(),
        ));
 */
