// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project3/UrunInfo.dart';
import 'constants.dart';

class UrunCard extends StatelessWidget {
  UrunCard({this.myColor, this.cardChild});

  final Color? myColor;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UrunInfo(),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                "images/hazirlaniyor.jpeg",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text("ÜRÜN İSMİ", style: Theme.of(context).textTheme.titleMedium),
            SizedBox(
              height: 8,
            ),
            Text(
              "ÜRÜN KODU",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text("******"),
          ],
        ),
      ),
    );
  }
}
